class EquityTypesController < ApplicationController
  before_action :set_equity_type, only: [:show, :edit, :update, :destroy]

  # GET /equity_types
  # GET /equity_types.json
  def index
    @equity_types = EquityType.all
  end

  # GET /equity_types/1
  # GET /equity_types/1.json
  def show
  end

  # GET /equity_types/new
  def new
    @equity_type = EquityType.new
  end

  # GET /equity_types/1/edit
  def edit
  end

  # POST /equity_types
  # POST /equity_types.json
  def create
    @equity_type = EquityType.new(equity_type_params)

    respond_to do |format|
      if @equity_type.save
        format.html { redirect_to @equity_type, notice: 'Equity type was successfully created.' }
        format.json { render :show, status: :created, location: @equity_type }
      else
        format.html { render :new }
        format.json { render json: @equity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equity_types/1
  # PATCH/PUT /equity_types/1.json
  def update
    respond_to do |format|
      if @equity_type.update(equity_type_params)
        format.html { redirect_to @equity_type, notice: 'Equity type was successfully updated.' }
        format.json { render :show, status: :ok, location: @equity_type }
      else
        format.html { render :edit }
        format.json { render json: @equity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equity_types/1
  # DELETE /equity_types/1.json
  def destroy
    @equity_type.destroy
    respond_to do |format|
      format.html { redirect_to equity_types_url, notice: 'Equity type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equity_type
      @equity_type = EquityType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equity_type_params
      params.require(:equity_type).permit(:name, :description, :status)
    end
end
