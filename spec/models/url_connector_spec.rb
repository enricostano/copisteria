# spec/models/url_connector_spec.rb
require 'spec_helper'

describe UrlConnector do
  before do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
  end
  it "has a valid factory" do
    FactoryGirl.create(:url_connector).should be_valid
  end
  it "is invalid without a user" do
    FactoryGirl.build(:url_connector, user: nil).should_not be_valid
  end
  it "is invalid without a temp_url" do
    FactoryGirl.build(:url_connector, temp_url: nil).should_not be_valid
  end
  it "is invalid without a line_item" do
    FactoryGirl.build(:url_connector, line_item: nil).should_not be_valid
  end
end
