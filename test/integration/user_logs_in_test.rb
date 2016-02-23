require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees dashboard change to their identity" do
    user = User.create(username: "Marvin", password: "password")
    visit login_path

    click_on "Login"

    fill_in "Username", with: "Marvin"

    fill_in "Password", with: "password"

    click_on "Login"

    assert_equal "/users/#{user.id}", current_path
    save_and_open_page

    assert page.has_content? "Welcome, Marvin"
  end
end
