class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :tender_id, :quantity, :tender, :order

  belongs_to :order
  belongs_to :tender
  has_one :url_connector, :dependent => :destroy

  validates :order, :tender, :quantity, :price, :presence => true
end
