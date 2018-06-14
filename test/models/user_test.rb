require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "foo", email: "foo@bar.com",
                     password: "foobaz1")
  end

  test "should be valid" do 
  	assert @user.valid? 
  end

  test "username should be present" do
  	@user.username = " "
  	assert_not @user.valid? 
  end

  test "username should be unique" do
  	dup_user = @user.dup
  	@user.save
  	assert_not dup_user.valid?
  end

  test "email should be present" do 
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "password should be present" do
  	@user.password = " " 
  	assert_not @user.valid? 
  end

  test "password should not be under 6 characters" do
  	@user.password = "a" * 5
  	assert_not @user.valid? 
  end
end
