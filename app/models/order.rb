class Order < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  validates :user, :presence => :true

  def add_line_items_to_order_from_cart(cart) do
    cart.each do | id, quantity |
      item = Project.find_by_id(id)
      @line_item = LineItem.new
      @line_item.project = item
      @line_item.quantity = quantity
      @line_item.price = item.price
      line_items << @line_item
    end
  end

end
