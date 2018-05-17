class User < ApplicationRecord
	validates :account,presence: true
	has_secure_password
end
