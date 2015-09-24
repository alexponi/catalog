class ThingLink < ActiveRecord::Base
  belongs_to :things
  belongs_to :link
end
