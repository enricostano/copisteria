require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save empty role" do
    role = Role.new
    assert role.invalid?
    assert role.errors[:name].any?
    assert !role.save, "Saved empty role"
  end

end
