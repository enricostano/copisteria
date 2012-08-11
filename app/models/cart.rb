class Cart < ActiveRecord::Base
  attr_accessible :shipped
  belongs_to :user
  has_many :line_items, :dependent => :destroy
  
  def add_project(project_id)
    current_item = line_items.find_by_project_id(project_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:project_id => project_id)
    end
    current_item
  end
end
