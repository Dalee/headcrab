require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

module CapybaraHelpers
  def basic_auth(username, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    page.driver.header('Authorization', credentials)
  end

  delegate :t, to: I18n
end

RSpec.configure do |config|
  config.include CapybaraHelpers, type: :feature
end
