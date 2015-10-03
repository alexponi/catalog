class ThingLocation < ActiveRecord::Base
  belongs_to :thing
  belongs_to :location

end
