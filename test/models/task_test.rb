require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "test2@example.com", password: "password")
    @category = Category.create(name: "Personal", user: @user)
    @task = Task.new(title: "Do laundry", category: @category, user: @user, due_date: Date.today)
  end

  test "should be valid with title, category, and user" do
    assert @task.valid?
  end

  test "should require a title" do
    @task.title = ""
    assert_not @task.valid?
  end

  test "should require a category" do
    @task.category = nil
    assert_not @task.valid?
  end

  test "should require a user" do
    @task.user = nil
    assert_not @task.valid?
  end

  test "should belong to category" do
    assert_respond_to @task, :category
  end

  test "should belong to user" do
    assert_respond_to @task, :user
  end
end
