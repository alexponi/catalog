class CreateThingLocations < ActiveRecord::Migration
  def change
    create_table :thing_locations do |t|
      t.string :thing_id
      t.string :location_id

      t.timestamps null: false
    end
  end
end
