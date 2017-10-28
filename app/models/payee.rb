class Payee < ApplicationRecord
    has_many :acct_transactions
    
    accepts_nested_attributes_for :acct_transactions
end
