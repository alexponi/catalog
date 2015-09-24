class CreateThingFiles < ActiveRecord::Migration
  def change
    create_table :thing_files do |t|
      t.belongs_to :thing, index: true
      t.belongs_to :file_name, index: true

      t.timestamps null: false
    end
  end
end
