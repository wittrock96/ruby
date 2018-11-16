class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :first_name, :last_name, :email, :location, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  validates :password, confirmation: true
  has_many :events, dependent: :destroy
  has_many :events_attending, through: :events, source: :event
end
