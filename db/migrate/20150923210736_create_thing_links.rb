class CreateThingLinks < ActiveRecord::Migration
  def change
    create_table :thing_links do |t|
      t.belongs_to :thing, index: true
      t.belongs_to :link, index: true

      t.timestamps null: false
    end
  end
end
