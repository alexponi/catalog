class AddFeatureToThings < ActiveRecord::Migration
  def change
    add_column :things, :feature, :string
    add_column :things, :abbreviation, :string
  end
end
