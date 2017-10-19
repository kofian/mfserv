class Risk < ApplicationRecord
    has_many :equities
    has_many :customers, through: :equities
end
