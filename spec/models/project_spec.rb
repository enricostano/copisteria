# spec/models/project_spec.rb
require 'spec_helper'

describe Project do
  it "has a valid factory" do
    FactoryGirl.create(:project).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:role, name: nil).should_not be_valid
  end
  it "is invalid without a start" do
    FactoryGirl.build(:project, start: nil).should_not be_valid
  end
  it "is invalid without a stop" do
    FactoryGirl.build(:project, stop: nil).should_not be_valid
  end
  it "is invalid without an institution" do
    FactoryGirl.build(:project, institution: nil).should_not be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:project, price: nil).should_not be_valid
  end
  it "is invalid if start date is after or same day than stop date" do
    FactoryGirl.build(:project, stop: '01-01-2012').should_not be_valid
  end
  it "return a collection of active project grouped by institutions" do
    institutionA = FactoryGirl.create(:institution, name: 'Comune di Manduria')
    institutionB = FactoryGirl.create(:institution, name: 'Comune di Avetrana')
    project1 = FactoryGirl.create(:project,
                                  start: Date.today - 2.week,
                                  stop: Date.today - 1.week,
                                  institution: institutionA)
    project2 = FactoryGirl.create(:project,
                                  start: Date.today - 2.week,
                                  stop: Date.today + 1.week,
                                  institution: institutionA)
    project3 = FactoryGirl.create(:project,
                                  start: Date.today - 1.week,
                                  stop: Date.today + 2.week,
                                  institution: institutionB)
    Project.nextbyinstitution.should have(2).items
  end
  it "verify if is referred by any line_items before to be destroyed"
end
