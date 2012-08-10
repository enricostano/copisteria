class Project < ActiveRecord::Base
  attr_accessible :name, :start, :stop, :institution_id, :file_projects_attributes
  belongs_to :institution
  has_many :file_projects, :dependent => :destroy
  validates :name, :start, :stop, :institution, :presence => true
  validate :start_before_stop_date
  accepts_nested_attributes_for :file_projects, :allow_destroy => true
  
  def start_before_stop_date
    if self.start && self.stop && self.start >= self.stop
      self.errors.add :start, ' deve essere prima di stop'
    end
  end
  
  def self.nextbyinstitution
    projects = where('stop > ?', Date.today)
    project_institutions = projects.group_by { |p| p.institution }
  end
end
