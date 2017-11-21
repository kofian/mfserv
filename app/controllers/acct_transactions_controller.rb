class AcctTransactionsController < ApplicationController
  layout "customer"
  before_action :authenticate_user!
  before_action :set_acct_transaction, only: [:show, :edit, :update, :destroy, :confirmtf]
  #before_action :gen_tac, only: [:confirmtf,:to_confirm]

  # GET /acct_transactions
  # GET /acct_transactions.json
  def index
    @acct_transactions = AcctTransaction.all
  end

  def confirmtf
    @payee = @acct_transaction.payee
    @account = Account.find(@acct_transaction.account_id)
    @tac = @acct_transaction.secure_tac
    AcctTransactionMailer.secure_tac(@tac,current_user.email,my_customer.name,@acct_transaction.id).deliver
  end
  def to_confirm
    @account = Account.find(params[:account_id])
    @recipient = Account.find('10000001887')
   if params[:search]
      @acct_transaction = AcctTransaction.find_by_secure_tac(params[:search])
      unless @acct_transaction.nil?
      @acct_transactions = AcctTransaction.transfer(@account,@recipient,@acct_transaction.amount,@acct_transaction)
      @acct_transaction.confirm!
       redirect_to customer_account_acct_transaction_path(my_customer,@acct_transaction.account_id,@acct_transaction.id)
      else
        redirect_to :back
      end
    else
      redirect_to root_path
     #redirect_to confirmtf_customer_account_acct_transaction_path(my_customer,@acct_transaction.account_id,@acct_transaction.id)
   end
  end
  # GET /acct_transactions/1
  # GET /acct_transactions/1.json
  def show
    @account = Account.find(@acct_transaction.account_id)
    @payee = @acct_transaction.payee
    #@recipient = Account.find(@acct_transaction.recipient_acct)
    if @acct_transaction.wire_transfers.present?
     @wire_transfer = @acct_transaction.wire_transfers.find_by_acct_transaction_id(params[:id])    
    end
  end

  # GET /acct_transactions/new
  def new
      @acct_transaction = AcctTransaction.new
      @acct_transaction.id = SecureRandom.random_number(99999999999999)
      @acct_transaction.account_id = params[:account_id]
      #@acct_transaction.date = Time.now
      #@acct_transaction.transaction_type_id = params[:transaction_type_id]
      @acct_transaction.amount = params[:amount]
      @wire_transfer = @acct_transaction.wire_transfers.new
    # for the view - show 'name' of transaction types
    #@trans_type = TransactionType.find(params[:transaction_type_id]).name
  end

  # GET /acct_transactions/1/edit
  def edit
  end

  # POST /acct_transactions
  # POST /acct_transactions.json
  def create
    #@acct_transaction.date = Time.now
    @acct_transaction = AcctTransaction.new(acct_transaction_params)
    @acct_transaction.id = SecureRandom.random_number(99999999999999)
    #@customer = Account.find(@acct_transaction.account_id)
    #@recipient = Account.find('10000001887')
    #@amount = params[:amount]
    @acct_transaction.recipient_id = 10000001887
    #@acct_transactions = AcctTransaction.transfer(@customer,@recipient,@acct_transaction.amount)
    #@acct_transaction.recipient_id = @recipient.id.to_i
    
    @acct_transaction.secure_tac = SecureRandom.random_number(99999999999999)
    #if @acct_transaction.valid?
    adjust_balance
    #end
    @acct_transaction.save!
    respond_to do |format|
      if @acct_transaction.valid?
        
        #modify_acct_balance
        logger.info "Transaction was just created"
        #@acct_transaction.confirm!
        if admin?
         format.html { redirect_to admin_payee_acct_transactions_path(@acct_transaction), notice: 'Acct transaction was successfully created.' }
        elsif @acct_transaction.pending?
          #@tac = SecureRandom.random_number(99999999999999)
          #AcctTransactionMailer.secure_tac(@tac,current_user.email,my_customer.name).deliver
          format.html { redirect_to confirmtf_customer_account_acct_transaction_path(my_customer,
          @acct_transaction.account_id,@acct_transaction.id), notice: 'Acct transaction was successfully created.' }
        end
        format.json { render :show, status: :created, location: @acct_transaction }
      else
         flash[:error] = @acct_transaction.errors
        format.html { redirect_to :back, :flash => { :alert => "INSUFFICIENT FUNDS!! Contact your relationship manager" } }
        format.json { render json: @acct_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acct_transactions/1
  # PATCH/PUT /acct_transactions/1.json
  def update
    respond_to do |format|
      if @acct_transaction.update(acct_transaction_params)
        format.html { redirect_to @acct_transaction, notice: 'Acct transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @acct_transaction }
      else
        format.html { render :edit }
        format.json { render json: @acct_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acct_transactions/1
  # DELETE /acct_transactions/1.json
  def destroy
    @acct_transaction.destroy
    respond_to do |format|
      format.html { redirect_to acct_transactions_url, notice: 'Acct transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acct_transaction
      @acct_transaction = AcctTransaction.find(params[:id])
    end
    def gen_tac
      @tac = SecureRandom.random_number(99999999999999)
      session[:tac] = @tac
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def acct_transaction_params
      params.require(:acct_transaction).permit(:account_id,:recipient_id,:payee_id, :recipient_acct,:date, :transaction_type_id, :description, :amount, :adjusted_bal, wire_transfers_attributes:[:id, :acct_transaction_id, :routing])
    end
    

  public
    def modify_acct_balance
      @account = Account.find(@acct_transaction.account_id)
     #@recipient = Account.find(@acct_transaction.recipient_acct)
   case @acct_transaction.transaction_type_id
    when 1,2,4,5,7
        @account.update_attributes!(balance: @account.balance - @acct_transaction.amount)
    when 3
       @account.update_attributes!(balance: @account.balance + @acct_transaction.amount)
    when 6,8
     @recipient = Account.find(@acct_transaction.recipient_acct)
     ActiveRecord::Base.transaction do
      @account.update(balance: @account.balance - @acct_transaction.amount)
      @recipient.update(balance: @recipient.balance + @acct_transaction.amount)
     end
       when 9
        @account.update_attributes!(balance: @account.balance - @acct_transaction.amount)
    end
  end
    def adjust_balance
      @account = Account.find(@acct_transaction.account_id)
      case @acct_transaction.transaction_type_id
          when 1,2,4,5,7
            @acct_transaction.adjusted_bal = Account.find(@acct_transaction.account_id).balance - @acct_transaction.amount
            when 3
              @acct_transaction.adjusted_bal = Account.find(@acct_transaction.account_id).balance + @acct_transaction.amount
          when 6,8
            @acct_transaction.adjusted_bal = Account.find(@acct_transaction.account).balance - @acct_transaction.amount
          when 9
           @acct_transaction.adjusted_bal = @account.balance
      end
    end
end
