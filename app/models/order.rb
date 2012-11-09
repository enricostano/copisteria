class Order < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  validates :user, :presence => :true

  def add_line_items_to_order_from_cart(cart)
    cart.each do | id, quantity |
      item = Tender.find(id)
      line_items << LineItem.new(tender: item,
                                 quantity: quantity,
                                 price: item.price,
                                 order: self)
    end
  end

end
