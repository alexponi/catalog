class Link < ActiveRecord::Base
  has_many :thing_links, dependent: :destroy
  has_many :things, through: :thing_links

  validates :name, presence: true
end
