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

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'russian', index_options: 'offsets'
      indexes :feature, analyzer: 'russian'
      indexes :abbreviation, analyzer: 'russian'
      indexes :description, analyzer: 'russian'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name^10', 'feature' ,'abbreviation' , 'description']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            name: {},
            feature: {},
            abbreviation: {},
            description: {}
          }
        }
      }
    )
  end
end

# Delete the previous index in Elasticsearch
Thing.__elasticsearch__.client.indices.delete index: Thing.index_name rescue nil

# Create the new index with the new mapping
Thing.__elasticsearch__.client.indices.create \
  index: Thing.index_name,
  body: { settings: Thing.settings.to_hash, mappings: Thing.mappings.to_hash }


Thing.import

