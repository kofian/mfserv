class TransactionType < ApplicationRecord
	has_many :acct_transaction
        has_many :recipient_detail
end
