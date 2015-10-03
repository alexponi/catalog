class Location < ActiveRecord::Base
	has_many :thing_locations
  has_many :things, :through => :thing_locations
end
