class CreateFileNames < ActiveRecord::Migration
  def change
    create_table :file_names do |t|
      t.string :name
      t.string :storage

      t.timestamps null: false
    end
  end
end
