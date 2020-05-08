class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  before_save :downcase
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  validates :password, confirmation: true
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :groups_joined, through: :members, source: :group
  private
    def downcase
  		self.name.downcase!
  		self.email.downcase!
  		
  	end
end
