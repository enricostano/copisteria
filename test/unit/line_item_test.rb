require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "should not save empty line_item" do
    line_item = LineItem.new
    assert line_item.invalid?
    assert line_item.errors[:order].any?
    assert line_item.errors[:project].any?
    assert line_item.errors[:quantity].any?
    assert line_item.errors[:price].any?
    assert !line_item.save, "Saved empty line_item"
  end
end
