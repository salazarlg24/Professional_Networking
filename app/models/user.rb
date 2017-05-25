class User < ApplicationRecord
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :name, :description, presence: true
	validates :password, :password_confirmation, presence: true, length: {minimum: 8}, :on => :create

	has_many :pendings, dependent: :destroy
	has_many :networks, dependent: :destroy
	has_many :friends, through: :networks, source: :users
	has_many :friends_pending, through: :pendings, source: :user

	before_save :email_lowercase

	def email_lowercase
		email.downcase!
	end

end
