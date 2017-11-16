class TransactionType < ApplicationRecord
	has_many :acct_transactions
    has_many :recipient_detail
end
