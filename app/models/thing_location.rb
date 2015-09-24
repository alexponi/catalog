class ThingLocation < ActiveRecord::Base
  belongs_to :things
  belongs_to :locations

end
