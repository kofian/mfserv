class TransactionType < ApplicationRecord
	belongs_to :acct_transaction
        belongs_to :recipient_detail
end
