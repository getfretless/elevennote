require 'test_helper'

class SessionsIntegrationTest < ActionDispatch::IntegrationTest

  test 'Allows a guest to sign up' do
    visit '/'
    click_link 'Sign up!'
    fill_in 'user_name', with: 'David Jones' # using ID attribute of form element
    fill_in 'user[username]', with: 'unixmonkey' # using NAME attribute of form element
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'
    assert page.has_content? 'Thanks for signing up!'
  end

  test 'Allows an existing user to log in' do
    login users(:dave)
    assert page.has_content? 'Welcome!'
  end

end