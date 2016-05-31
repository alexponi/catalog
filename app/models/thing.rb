require 'elasticsearch/model'
class Thing < ActiveRecord::Base
  include Elasticsearch::Model
  include Searchable

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

  def self.search(name, feature, abbreviation)
    collection = self.all
    collection = collection.where(name: name) if name.present?
    collection = collection.where(feature: feature) if feature.present?
    collection = collection.where(abbreviation: abbreviation) if abbreviation.present?
    return collection
  end

  def as_indexed_json
    self.as_json({
      only: [:name, :feature, :abbreviation, :description]
    })
  end


end
