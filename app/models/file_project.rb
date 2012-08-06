class FileProject < ActiveRecord::Base
  attr_accessible :file_uid, :name, :project_id, :remove_file
  file_accessor :file
  belongs_to :project
  validates :name, :file, :project, :presence => true
end
