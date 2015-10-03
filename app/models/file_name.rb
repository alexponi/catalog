class FileName < ActiveRecord::Base
	has_many :thing_files
  has_many :things, :through => :thing_files
end
