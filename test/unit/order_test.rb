require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should not save empty order" do
    order = Order.new
    assert order.invalid?
    assert order.errors[:user].any?
    assert !order.save, 'Saved empty order'
  end

  test "add line_items to order from cart" do
    create_list(:role, 3)
    cart = { create(:project).id => 1 }
    order = build(:order)
    assert order.add_line_items_to_order_from_cart(cart)
  end
end
