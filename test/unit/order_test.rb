require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should not save empty order" do
    order = Order.new
    assert order.invalid?
    assert order.errors[:user].any?
    assert !order.save, 'Saved empty order'
  end

  test "add line_items to order from cart" do
    
end
