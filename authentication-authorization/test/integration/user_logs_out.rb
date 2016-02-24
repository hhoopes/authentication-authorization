require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees dashbboard revert to general welcome" do
    user = User.create(username: "Fancy", password: "password")
    post "session"

    assert_equal "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, Marvin"
  end
end
