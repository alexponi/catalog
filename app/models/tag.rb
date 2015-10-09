class Tag < ActiveRecord::Base  
  has_many :thing_tags, dependent: :destroy
  has_many :things, through: :thing_tags
end
