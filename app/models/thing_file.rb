class ThingFile < ActiveRecord::Base
  belongs_to :things
  belongs_to :file_names
end
