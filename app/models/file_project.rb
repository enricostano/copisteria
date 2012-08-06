class FileProject < ActiveRecord::Base
  attr_accessible :file_uid, :name, :project_id, :file, :remove_file
  file_accessor :file
  belongs_to :project
  validates :name, :file, :presence => true
end
