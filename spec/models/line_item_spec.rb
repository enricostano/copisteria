# spec/models/line_items_spec.rb
require 'spec_helper'

describe LineItem do
  before do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
  end
 
  it "has a valid factory" do
    FactoryGirl.create(:line_item).should be_valid
  end
  it "is invalid without a order" do
    FactoryGirl.build(:line_item, order: nil).should_not be_valid
  end
  it "is invalid without a project" do
    FactoryGirl.build(:line_item, project: nil).should_not be_valid
  end
  it "is invalid without a quantity" do
    FactoryGirl.build(:line_item, quantity: nil).should_not be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:line_item, price: nil).should_not be_valid
  end
end
