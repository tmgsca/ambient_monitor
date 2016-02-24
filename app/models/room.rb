class Room < ActiveRecord::Base
  has_many :measures
  belongs_to :user
end
