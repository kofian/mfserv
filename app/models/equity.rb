class Equity < ApplicationRecord
    belongs_to :customer
    belongs_to :risk
    belongs_to :equity_type
end
