class CreateThingLocations < ActiveRecord::Migration
  def change
    create_table :thing_locations do |t|
      t.belongs_to :thing, index: true
      t.belongs_to :location, index: true 

      t.timestamps null: false
    end
  end
end
