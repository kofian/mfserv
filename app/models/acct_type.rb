class AcctType < ApplicationRecord
   #belongs_to :account
   has_many :accounts
end
