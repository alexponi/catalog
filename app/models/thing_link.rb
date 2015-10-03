class ThingLink < ActiveRecord::Base
  belongs_to :thing
  belongs_to :link
end
