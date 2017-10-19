class Customer < ApplicationRecord
	belongs_to :user, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_many :accounts, :dependent => :destroy
	has_many :equities, :dependent => :destroy
	has_many :risks, through: :equities

	validates :phone1, :firstname, :lastname, presence: true
	validates_format_of :phone1, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

	# validates_format_of :phone2, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

	accepts_nested_attributes_for :accounts, :allow_destroy => true
	accepts_nested_attributes_for :address, :allow_destroy => true
	
	def name
		[firstname,lastname].join (' ')
	end
end
