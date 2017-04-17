class ZipCode < ApplicationRecord
	has_many :addresses
        #belongs_to :address
	belongs_to :state, foreign_key: 'state_abbreviation'
end
