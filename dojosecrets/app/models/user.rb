class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  before_save :downcase
  validates :name, :email, presence: true
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true

  private
  	def downcase
  		self.name.downcase!
  		self.email.downcase!
  		
  	end
end
