class Text < ActiveRecord::Base
  has_many :thing_texts
  has_many :things, :through => :thing_texts  
end
