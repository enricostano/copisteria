class Project < ActiveRecord::Base
  attr_accessible :name, :start, :stop, :institution_id, :price, :file
  belongs_to :institution
  file_accessor :file
  has_many :orders
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name, :start, :stop, :institution, :price, :presence => true
  validate :start_before_stop_date

  
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
