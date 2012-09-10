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

  test "partitaiva must be unique" do
    user1 = build(:user, partitaiva: "12345678901")
    user1.roles << build(:role)
    user1.save
    assert user1.valid?, "User1 was not valid #{user1.errors.inspect}"
    user2 = build(:user, partitaiva: "12345678901")
    user2.roles << build(:role)
    user2.save
    assert user2.invalid?, "User2 was not valid #{user2.errors.inspect}"
    assert_equal "has already been taken", user2.errors[:partitaiva].join('; ')
  end

  test "email must be unique" do
    user1 = build(:user, email: "thesame@email.com")
    user1.roles << build(:role)
    user1.save
    assert user1.valid?, "User1 was not valid #{user1.errors.inspect}"
    user2 = build(:user, email: "thesame@email.com")
    user2.roles << build(:role)
    user2.save
    assert user2.invalid?, "User2 was not valid #{user2.errors.inspect}"
    assert_equal "has already been taken", user2.errors[:email].join('; ')
  end

  test "saving a user without role it assign it user role with id 3" do
    role1 = create(:role)
    role2 = create(:role)
    role3 = create(:role)
    user = create(:user)
    assert user.roles.include?(role3), "no way"
  end
end
