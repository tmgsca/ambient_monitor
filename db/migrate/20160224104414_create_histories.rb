class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :room, index: true, foreign_key: true
      t.float :max_temperature
      t.float :min_temperature
      t.float :avg_temperature
      t.float :max_humidity
      t.float :min_humidity
      t.float :avg_humidity

      t.timestamps null: false
    end
  end
end
