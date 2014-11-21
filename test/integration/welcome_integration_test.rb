require 'test_helper'

class WelcomeIntegrationTest < ActionDispatch::IntegrationTest

  test 'The home page has the name of the app' do
    visit '/'
    assert page.has_content? 'ElevenNote'
  end

end