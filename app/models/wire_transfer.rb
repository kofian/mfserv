class WireTransfer < ApplicationRecord
  belongs_to :acct_transaction

   validates :recipient_name, presence: true
end
