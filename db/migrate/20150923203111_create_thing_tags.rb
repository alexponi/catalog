class CreateThingTags < ActiveRecord::Migration
  def change
    create_table :thing_tags do |t|
      t.belongs_to :thing, index: true
      t.belongs_to :tag, index: true

      t.timestamps null: false
    end
  end
end
