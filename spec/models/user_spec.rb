# spec/models/user_spec.rb
require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it "is invalid without a password_confirmation" do
    FactoryGirl.build(:user, phone: nil).should_not be_valid
  end
  it "is invalid without a phone"
  it "is invalid without an address"
  it "is invalid without a cap"
  it "is invalid without a city"
  it "is invalid without a partitaiva"
  it "is invalid without a ragionesociale"
  it "is invalid with a cap with more than 5 digits"
  it "is invalid with a partitaiva with more than 11 digits"
  it "is invalid with a cap with other characters than digits"
  it "is invalid with a partitaiva with other characters than digits"
  it "does not allow duplicate partita iva per user"
end
