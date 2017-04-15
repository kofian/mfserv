class ZipCode < ApplicationRecord
	has_one :state
	belongs_to :address
end
