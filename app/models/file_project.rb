class FileProject < ActiveRecord::Base
  attr_accessible :file_uid, :name
  file_accessor :file
  belongs_to :project
end
