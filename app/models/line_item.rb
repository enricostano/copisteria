class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :project_id, :quantity

  belongs_to :order
  belongs_to :project
end
