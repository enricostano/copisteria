# spec/models/order_spec.rb
require 'spec_helper'

describe Order do
  before do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
  end
  it "has a valid factory" do
    FactoryGirl.create(:order).should be_valid
  end
  it "is invalid without a user" do
    FactoryGirl.build(:order, user: nil).should_not be_valid
  end
  it "add line_items to order from cart" do
    project = FactoryGirl.create(:project)
    cart = { project.id => 1 }
    order = FactoryGirl.build(:order)
    order.add_line_items_to_order_from_cart(cart)
    order.save!
    order.line_items.first.project.should eq project
    order.line_items.first.quantity.should eq 1
  end
end
