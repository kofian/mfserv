class Account < ApplicationRecord
	belongs_to :customer
	#belongs_to :user
	belongs_to :acct_type
	has_many :acct_transactions, :dependent => :destroy
	has_many :recipients, through: :acct_transactions, :dependent => :destroy
    #has_many :recipient_details, :dependent => :destroy
       

	#accepts_nested_attributes_for :acct_type
	accepts_nested_attributes_for :acct_transactions

	validates :acct_type_id, presence: true
end
