class AddParametersToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :max_winter_temp, :float, default: 23.0
    add_column :rooms, :max_summer_temp, :float, default: 26.0
    add_column :rooms, :min_winter_temp, :float, default: 20.0
    add_column :rooms, :min_summer_temp, :float, default: 24.0
    add_column :rooms, :max_summer_humidity, :float, default: 70.0
    add_column :rooms, :max_winter_humidity, :float, default: 70.0
    add_column :rooms, :min_summer_humidity, :float, default: 30.0
    add_column :rooms, :min_winter_humidity, :float, default: 30.0
  end
end
