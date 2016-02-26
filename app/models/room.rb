class Room < ActiveRecord::Base
  has_many :measures
  has_many :room_measures_history
  belongs_to :user
  belongs_to :session
end
