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
    assert !user.save, "Saved empty user"
  end
  
  test "cap's lenght cannot be more than 5" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :partitaiva => "12345678901")
    
    user.cap = "123456"
    assert user.invalid?
    assert_equal "is the wrong length (should be 5 characters)", user.errors[:cap].join('; ')
  end
  
  test "cap's lenght cannot be less than 5" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :partitaiva => "12345678901")
    
    user.cap = "1234"
    assert user.invalid?
    assert_equal "is the wrong length (should be 5 characters)", user.errors[:cap].join('; ')
  end
  
  test "cap's lenght is 5" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :partitaiva => "12345678901")
    
    user.cap = "12345"
    assert user.valid?
  end
  
  test "partitaiva's lenght cannot be more than 11" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :cap        => "12345")
    
    user.partitaiva = "123456789012"
    assert user.invalid?
    assert_equal "is the wrong length (should be 11 characters)", user.errors[:partitaiva].join('; ')
  end

  test "partitaiva's lenght cannot be less than 11" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :cap        => "12345")
    
    user.partitaiva = "1234567890"
    assert user.invalid?
    assert_equal "is the wrong length (should be 11 characters)", user.errors[:partitaiva].join('; ')
  end
  
  test "partitaiva's lenght is 11" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :cap        => "12345")
    
    user.partitaiva = "12345678901"
    assert user.valid?
  end

  test "partitaiva cannot be non digit characters" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :cap        => "12345")
    
    user.partitaiva = "questaNON31"
    assert user.invalid?
    assert_equal "is not a number", user.errors[:partitaiva].join('; ')
    
    user.partitaiva = "questaNONep"
    assert user.invalid?
    assert_equal "is not a number", user.errors[:partitaiva].join('; ')
  end

  test "partitaiva has only digit characters" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :cap        => "12345")
    
    user.partitaiva = "12345678901"
    assert user.valid?
  end

  test "cap cannot be non digit characters" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :partitaiva => "12345678901")
    
    user.cap = "qu3st"
    assert user.invalid?
    assert_equal "is not a number", user.errors[:cap].join('; ')
    
    user.partitaiva = "quest"
    assert user.invalid?
    assert_equal "is not a number", user.errors[:cap].join('; ')
  end

  test "cap has only digit characters" do
    user = User.new(:email      => "puppy@puppa.pup",
                    :password   => "secret",
                    :phone      => "0999711333",
                    :address    => "via plutarco, 37",
                    :city       => "Barcelona",
                    :partitaiva => "12345678901")
    
    user.cap = "12345"
    assert user.valid?
  end
end
