class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.float :temperature
      t.float :humidity
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
