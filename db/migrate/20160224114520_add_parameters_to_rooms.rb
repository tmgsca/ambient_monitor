class AddParametersToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :max_winter_temp, :float
    add_column :rooms, :max_summer_temp, :float
    add_column :rooms, :min_winter_temp, :float
    add_column :rooms, :min_summer_temp, :float
    add_column :rooms, :max_summer_humidity, :float
    add_column :rooms, :max_winter_humidity, :float
    add_column :rooms, :min_summer_humidity, :float
    add_column :rooms, :min_winter_humidity, :float
  end
end
