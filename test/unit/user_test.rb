require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save empty user" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:phone].any?
    assert user.errors[:address].any?
    assert user.errors[:partitaiva].any?
    assert user.errors[:city].any?
    assert user.errors[:cap].any?
    assert user.errors[:ragionesociale].any?
    assert !user.save, "Saved empty user"
  end

  test "all the values are corrects" do
    user = build(:user)
    assert user.valid?
  end

  test "cap length cannot be more than 5" do
    user = build(:user, cap: "123456")
    assert user.invalid?
    assert_equal "is the wrong length (should be 5 characters)", user.errors[:cap].join('; ')
  end

  test "cap length cannot be less than 5" do
    user = build(:user, cap: "1234")
    assert user.invalid?
    assert_equal "is the wrong length (should be 5 characters)", user.errors[:cap].join('; ')
  end

  test "cap cannot be non digital characters" do
    user = build(:user, cap: "123A5")
    assert user.invalid?
    assert_equal "is not a number", user.errors[:cap].join('; ')
  end

  test "partitaiva length cannot be more than 11" do
    user = build(:user, partitaiva: "123456789012")
    assert user.invalid?
    assert_equal "is the wrong length (should be 11 characters)", user.errors[:partitaiva].join('; ')
  end

  test "partitaiva length cannot be less than 11" do
    user = build(:user, partitaiva: "1234567890")
    assert user.invalid?
    assert_equal "is the wrong length (should be 11 characters)", user.errors[:partitaiva].join('; ')
  end

  test "partitaiva cannot be non digit characters" do
    user = build(:user, partitaiva: "123A56TedO1")
    assert user.invalid?
    assert_equal "is not a number", user.errors[:partitaiva].join('; ')
  end

  test "partita iva must be unique" do
    user = build(:user)
    user.valid?

  end
end
