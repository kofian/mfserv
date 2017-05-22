class User < ActiveRecord::Base
  before_create :generate_id

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :customer, :dependent => :destroy
  has_many :accounts, through: :customer
  has_one :address, through: :customer

  accepts_nested_attributes_for :customer, :allow_destroy => true
  #accepts_nested_attributes_for :accounts, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true

  has_one :administrator
  
  validates_presence_of :username, :email
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i

  # Generate a random uuid for new user id creation
  def generate_id
  	self.id = SecureRandom.uuid
  end
  # Allow signin by either email or username ("lower" function might have to be removed?)
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_h).first
      end
  end
end
