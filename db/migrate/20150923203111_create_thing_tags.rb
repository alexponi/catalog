class CreateThingTags < ActiveRecord::Migration
  def change
    create_table :thing_tags do |t|
      t.string :thing_id
      t.string :tag_id

      t.timestamps null: false
    end
  end
end
