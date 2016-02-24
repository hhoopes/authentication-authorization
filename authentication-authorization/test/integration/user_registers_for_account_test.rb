require 'test_helper'

class UserRegistersForAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test 'user sees name on dashboard' do

    visit '/'

    click_on "Register"

    fill_in "Username", with: "heidi"

    fill_in "Password", with: "password"

    click_on "Create Account"

    user = User.last

    assert_equal "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, Heidi"
    session.clear
  end
  # new user visits root of site
  # clicks "Create account"
  # gets directed to new account form
  #fills in username and password
  # clicks submit
  # page flashes message that account was successfully created
  # navbar says welcome, username message
  # user can then log in to account with credentials
end
