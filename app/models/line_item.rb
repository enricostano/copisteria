class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :project_id, :quantity, :project

  belongs_to :order
  belongs_to :project
  has_one :url_connector, :dependent => :destroy
end
