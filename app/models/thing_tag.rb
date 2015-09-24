class ThingTag < ActiveRecord::Base
  belongs_to :things
  belongs_to :tags
end
