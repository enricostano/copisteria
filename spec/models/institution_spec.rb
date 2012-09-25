# spec/models/institution_spec.rb
require 'spec_helper'

describe Institution do
  it "has a valid factory"
    FactoryGirl.create(:institution).should be_valid
  it "is invalid without an email"
  it "is invalid without a name"
  it "is invalid without a phone"
end
