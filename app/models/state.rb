class State < ApplicationRecord
  self.primary_key = 'abbreviation'
  has_many :zip_codes
  has_many :addresses, through: :zip_codes

end
