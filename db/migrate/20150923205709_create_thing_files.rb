class CreateThingFiles < ActiveRecord::Migration
  def change
    create_table :thing_files do |t|
      t.string :thing_id
      t.string :file_id

      t.timestamps null: false
    end
  end
end
