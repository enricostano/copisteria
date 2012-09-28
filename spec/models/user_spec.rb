# spec/models/user_spec.rb
require 'spec_helper'

describe User do
  before do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
  end

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
    FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid
  end
  it "is invalid without a phone" do
    FactoryGirl.build(:user, phone: nil).should_not be_valid
  end
  it "is invalid without an address" do
    FactoryGirl.build(:user, address: nil).should_not be_valid
  end
  it "is invalid without a cap" do
    FactoryGirl.build(:user, cap: nil).should_not be_valid
  end
  it "is invalid without a city" do
    FactoryGirl.build(:user, city: nil).should_not be_valid
  end
  it "is invalid without a partitaiva" do
    FactoryGirl.build(:user, partitaiva: nil).should_not be_valid
  end
  it "is invalid without a ragionesociale" do
    FactoryGirl.build(:user, ragionesociale: nil).should_not be_valid
  end
  it "is invalid with a cap with more or less than 5 digits" do
    FactoryGirl.build(:user, cap: '123456').should_not be_valid
  end
  it "is invalid with a partitaiva with more or less than 11 digits" do
    FactoryGirl.build(:user, partitaiva: '123456789').should_not be_valid
  end
  it "is invalid with a cap with other characters than digits" do
    FactoryGirl.build(:user, cap: 'l23A5').should_not be_valid
  end
  it "is invalid with a partitaiva with other characters than digits" do
    FactoryGirl.build(:user, partitaiva: 'l23A56T89O1').should_not be_valid
  end
  it "does not allow duplicate partita iva per user" do
    FactoryGirl.create(:user, partitaiva: '12345678901')
    FactoryGirl.build(:user, partitaiva: '12345678901').should_not be_valid
  end
  it "does not allow duplicate email per user" do
    FactoryGirl.create(:user, email: 'puppa@puppa.pup')
    FactoryGirl.build(:user, email: 'puppa@puppa.pup').should_not be_valid
  end
  it "verify if the user has the asked role" do
    user = FactoryGirl.create(:user)
    user.roles << Role.find_by_id(1)
    user.any_role?('SuperAdmin').should be true
  end
  it "assign role User if it's not specified any role while creating a new user" do
    user = FactoryGirl.create(:user)
    user.any_role?('User').should be true
  end
    
end
