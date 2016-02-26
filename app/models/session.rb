class Session < ActiveRecord::Base
  belongs_to :user
  has_one :room
  has_secure_token

  def is_admin?
    user.role_id == 1
  end
end
