class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: {in: 2..20}
	validates :email, presence: true, { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :age, numerically: true, greater_than: 10, less_than: 150
end
