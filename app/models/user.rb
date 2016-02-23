class User < ActiveRecord::Base
  	has_secure_password
    has_many :rooms
    has_many :sessions
    belongs_to :role

    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	  validates :password, length: {:within => 6..40}, on: :create
end
