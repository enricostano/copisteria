require 'test_helper'

class FileProjectTest < ActiveSupport::TestCase
  test "should not save empty file_project" do
    file_project = FileProject.new
    assert file_project.invalid?
    assert file_project.errors[:name].any?
    assert file_project.errors[:file].any?
    assert file_project.errors[:project].any?
    assert !file_project.save, "Saved empty FileProject"
  end
end
