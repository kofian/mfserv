#class AcctTransaction < ApplicationRecord
class AcctTransaction < ActiveRecord::Base	
  include AASM
  
    belongs_to :account
    belongs_to :recipient, class_name: 'Account', foreign_key: 'recipient_id'
    belongs_to :transaction_type
    has_many :wire_transfers
    belongs_to :payee
       
       accepts_nested_attributes_for :wire_transfers, reject_if: lambda {|attributes| attributes['acct_transaction_id'].blank?}, :allow_destroy => true    
  accepts_nested_attributes_for :payee, :allow_destroy => true
	accepts_nested_attributes_for :transaction_type, :allow_destroy => false
        validates :amount,  presence: true
	validates_numericality_of :amount
	validate :funds_availability

   aasm column: "status" do
     state :pending, initial: true
     state :confirmed
     state :processing
     state :onhold
     state :rejected
     state :processed
     
      event :confirm do
        transitions from: [:pending], to: :confirmed
      end
      event :process do
        transitions from: [:confirmed], to: :processing
      end
      event :ongoing do
        transitions from: [:processing], to: :onhold
      end
      event :reject do
        transitions from: [:onhold], to: :rejected
      end  
      event :accept do
        transitions from: [:processing], to: :processed
      end
      event :reversing do
        transitions from: [:confirmed], to: :pending
      end     
   end
   
  def self.deposit(recipient, amount)
    puts "Depositing #{amount} on account #{recipient.id}"
    return false unless self.amount_valid?(amount)
    recipient.balance = (recipient.balance += amount).round(2)
    recipient.save!
  end

  def self.withdraw(account, amount)
    puts "Withdrawing #{amount} on account #{account.id}"
    return false unless self.amount_valid?(amount)
    account.balance = (account.balance -= amount).round(2)
    account.save!
  end

  def self.transfer(account, recipient, amount)
    puts "Transfering #{amount} from account #{account.id} to account #{recipient.id}"
    return false unless self.amount_valid?(amount)
    ActiveRecord::Base.transaction do
      self.withdraw(account, amount)
      self.deposit(recipient, amount)
    end
  end


    def funds_availability
      if self.transaction_type_id == 7 && self.amount > Account.find(self.account_id).balance
	errors.add(:amount, 'INSUFFICIENT FUNDS!! Please try again')
      end
    end
    
    def self.amount_valid?(amount)
      validates_numericality_of :amount
    end
end
