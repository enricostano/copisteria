require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save empty project" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:name].any?
    assert project.errors[:institution].any?
    assert project.errors[:start].any?
    assert project.errors[:stop].any?
    assert project.errors[:price].any?
    assert !project.save, "Saved empty project"
  end

  test "all the values are corrects" do
    project = build(:project)
    assert project.valid?
  end
 
  test "stop must be greater than start date" do
    project = build(:project, start: "2012-08-03", stop: "2012-08-01")
	  assert project.invalid?
	  assert_equal " deve essere prima di stop", project.errors[:start].join('; ')
  end
  
  test "stop can't be equal to start date" do
	  project = build(:project, start: "2012-08-03", stop: "2012-08-03")
	  assert project.invalid?
	  assert_equal " deve essere prima di stop", project.errors[:start].join('; ')
  end
  
end
