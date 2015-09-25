class CreateThingTexts < ActiveRecord::Migration
  def change
    create_table :thing_texts do |t|
      t.belongs_to :thing, index: true
      t.belongs_to :text, index: true

      t.timestamps null: false
    end
  end
end
