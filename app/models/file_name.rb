class FileName < ActiveRecord::Base
	has_many :thing_files, dependent: :destroy
  has_many :things, :through => :thing_files
end
