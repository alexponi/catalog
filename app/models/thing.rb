require 'elasticsearch/model'

class Thing < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :thing_tags
  has_many :tags, through: :thing_tags

  has_many :thing_locations
  has_many :locations, through: :thing_locations

  has_many :thing_files
  has_many :file_names, through: :thing_files

  has_many :thing_links
  has_many :links, through: :thing_links

  has_many :thing_texts
  has_many :texts, through: :thing_texts

  validates :name, presence: true
  validates :description, presence: true

end

Thing.import

