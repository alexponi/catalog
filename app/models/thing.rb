class Thing < ActiveRecord::Base
  has_many :thing_tags
  has_many :tags, through: :thing_tags
  has_many :thing_locations
  has many :locations, through: :thing_locations
  has_many :thing_files
  has_many :file_names, through: :thing_files
  has_many :thing_links
  has_many :link, through: :thing_links
end
