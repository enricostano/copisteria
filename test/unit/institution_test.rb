require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase
  test "should not save empty institution" do
    institution = Institution.new
    assert institution.invalid?
    assert institution.errors[:name].any?
    assert institution.errors[:phone].any?
    assert institution.errors[:email].any?
    assert !institution.save, "Saved empty institution"
  end
end
