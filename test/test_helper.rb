ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.default_driver = :selenium

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def login(user)
    visit '/'
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: 'password'
    click_button 'Sign In'
  end

  def logout
    click_link 'Logout' if page.has_content? 'Logout'
  end

  def fill_in_richtext(page, content)
    if Capybara.current_driver == :selenium
      page.execute_script "Bootsy.areas['note_body_html'].editor.setValue('#{content}');"
    else
      fill_in 'note[body_html]', with: content
    end
  end

  def choose_note(note)
    within('#notes') do
      list_items = all('#notes > li')
      list_item = list_items.detect { |li| li['data-url'].to_s.include?("/notes/#{note.id}") }
      list_item.click
    end
  end

end