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
    if name != "" and feature != "" and abbreviation != ""
      self.where(name: name, feature: feature, abbreviation: abbreviation).to_a
    elsif name != "" and feature != "" and abbreviation = ""
      self.where(:name => "#{name}", :feature => "#{feature}").to_a
    elsif name != "" and feature = "" and abbreviation != ""
      self.where(:name => "#{name}", :abbreviation => "#{abbreviation}").to_a
    elsif name = "" and feature != "" and abbreviation != ""
      self.where(:feature => "#{feature}", :abbreviation => "#{abbreviation}").to_a
    elsif name != "" and feature = "" and abbreviation = ""
      self.where(:name => "#{name}").to_a
    elsif name = "" and feature != "" and abbreviation = ""
      self.where(:feature => "#{feature}").to_a
    elsif name = "" and feature = "" and abbreviation != ""
      self.where(:abbreviation => "#{abbreviation}").to_a
    else
      self.all
    end
  end


end
