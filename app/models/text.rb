class Text < ActiveRecord::Base
  has_many :thing_texts, dependent: :destroy
  has_many :things, :through => :thing_texts

  validates :text, presence: true 
end
