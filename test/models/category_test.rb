require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "test@example.com", password: "password")
    @category = Category.new(name: "Work", user: @user)
  end

  test "should be valid with name and user" do
    assert @category.valid?
  end

  test "should require a name" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "should require a user" do
    @category.user = nil
    assert_not @category.valid?
  end

  test "should have many tasks" do
    assert_respond_to @category, :tasks
  end
end
