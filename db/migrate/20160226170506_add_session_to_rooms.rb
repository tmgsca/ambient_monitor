class AddSessionToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :session, index: true, foreign_key: true
  end
end
