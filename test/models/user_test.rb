require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@example.com", password: "password")
  end

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should require an email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "should require a password" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "should have many categories" do
    assert_respond_to @user, :categories
  end

  test "should have many tasks" do
    assert_respond_to @user, :tasks
  end
end
