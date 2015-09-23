class CreateThingLinks < ActiveRecord::Migration
  def change
    create_table :thing_links do |t|
      t.string :thing_id
      t.string :link_id

      t.timestamps null: false
    end
  end
end
