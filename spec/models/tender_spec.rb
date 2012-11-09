# spec/models/tender_spec.rb
require 'spec_helper'

describe Tender do
  it "has a valid factory" do
    FactoryGirl.create(:tender).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:tender, name: nil).should_not be_valid
  end
  it "is invalid without a start" do
    FactoryGirl.build(:tender, start: nil).should_not be_valid
  end
  it "is invalid without a stop" do
    FactoryGirl.build(:tender, stop: nil).should_not be_valid
  end
  it "is invalid without an institution" do
    FactoryGirl.build(:tender, institution: nil).should_not be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:tender, price: nil).should_not be_valid
  end
  it "is invalid if start date is after or same day than stop date" do
    FactoryGirl.build(:tender, stop: '01-01-2012').should_not be_valid
  end
  it "is invalid with a price that it isn't a number" do
    FactoryGirl.build(:tender, price: '12 euro').should_not be_valid
  end
  it "return a collection of active tender grouped by institutions" do
    institutionA = FactoryGirl.create(:institution, name: 'Comune di Manduria')
    institutionB = FactoryGirl.create(:institution, name: 'Comune di Avetrana')
    tender1 = FactoryGirl.create(:tender,
                                  name: 'tender1',
                                  start: Date.today - 2.week,
                                  stop: Date.today - 1.week,
                                  institution: institutionA)
    tender2 = FactoryGirl.create(:tender,
                                  name: 'tender2',
                                  start: Date.today - 2.week,
                                  stop: Date.today + 1.week,
                                  institution: institutionA)
    tender3 = FactoryGirl.create(:tender,
                                  name: 'tender3',
                                  start: Date.today - 1.week,
                                  stop: Date.today + 2.week,
                                  institution: institutionB)
    Tender.nextbyinstitution.should have(2).items
    Tender.nextbyinstitution[institutionA].first.name.should eq 'tender2'
    Tender.nextbyinstitution[institutionB].first.name.should eq 'tender3'
    Tender.nextbyinstitution[institutionA].first.stop.should > Date.today
    Tender.nextbyinstitution[institutionB].first.stop.should > Date.today
  end
  it "verify if is referred by any line_items before to be destroyed" do
    ['SuperAdmin', 'Admin', 'User'].each { |rolename| FactoryGirl.create(:role, name: rolename) }
    user = FactoryGirl.create(:user, :confirmed)
    institution = FactoryGirl.create(:institution, name: 'Comune di Avetrana')
    tender = FactoryGirl.create(:tender,
                                 start: Date.today - 2.week,
                                 stop: Date.today + 1.week,
                                 institution: institution)
    order = FactoryGirl.create(:order,
                               user: user)
    line_item = FactoryGirl.create(:line_item,
                                   order: order,
                                   tender: tender)
    tender.destroy.should be false
  end

end
