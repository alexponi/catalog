class Location < ActiveRecord::Base
	has_many :thing_locations, dependent: :destroy
  has_many :things, :through => :thing_locations
end
