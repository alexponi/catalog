class ThingText < ActiveRecord::Base
	belongs_to :thing
  belongs_to :text
end
