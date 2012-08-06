class Project < ActiveRecord::Base
  attr_accessible :name, :start, :stop, :institution_id, :files
  belongs_to :institution
  has_many :files, :dependent => :destroy
  validates :name, :start, :stop, :institution, :presence => true
  validate :start_before_stop_date
  
  def start_before_stop_date
    if self.start && self.stop && self.start >= self.stop
      self.errors.add :start, ' deve essere prima di stop'
    end
  end
  
end
