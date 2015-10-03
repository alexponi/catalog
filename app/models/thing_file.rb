class ThingFile < ActiveRecord::Base
  belongs_to :thing
  belongs_to :file_name
end
