class Thing < ActiveRecord::Base
  has_many :thing_tags
  has_many :tags, through: :thing_tags
  has_many :thing_locations
  has_many :locations, through: :thing_locations
  has_many :thing_files
  has_many :file_names, through: :thing_files
  has_many :thing_links
  has_many :link, through: :thing_links
  has_many :thing_texts
  has_many :texts, through: :thing_texts

  def self.search(search)
    if search
      self.where(:name => "%#{search}%").to_a
    else
      self.all
    end
  end
end
