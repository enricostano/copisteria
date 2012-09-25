# spec/models/institution_spec.rb
require 'spec_helper'

describe Institution do
  it "has a valid factory" do
    FactoryGirl.create(:institution).should be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:institution, email: nil).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:institution, name: nil).should_not be_valid
  end
  it "is invalid without a phone" do
    FactoryGirl.build(:institution, phone: nil).should_not be_valid
  end
end
