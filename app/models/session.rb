class Session < ActiveRecord::Base
  belongs_to :user
  has_secure_token
end
