class Project < ActiveRecord::Base
  attr_accessible :name, :start, :stop, :institution_id, :price, :file, :file_uid, :remove_file
  belongs_to :institution
  file_accessor :file
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name, :start, :stop, :institution, :price, :presence => true
  validate :start_before_stop_date

  
  def start_before_stop_date
    if self.start && self.stop && self.start >= self.stop
      self.errors.add :base, 'La data di inizio deve essere antecedente alla data di fine'
      self.errors.add :start, 'La data di inizio deve essere antecedente alla data di fine'
      self.errors.add :stop, 'La data di inizio deve essere antecedente alla data di fine'
    end
  end
  
  def self.nextbyinstitution
    projects = where('stop > ?', Date.today)
    project_institutions = projects.group_by { |p| p.institution }
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
