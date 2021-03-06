ENV['RAILS_ENV'] ||= 'test'
ENV['TEST_USER'] ||= 'app'
ENV['TEST_PASSWORD'] ||= 'error'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'simplecov'

SimpleCov.start
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    Faker::Config.locale = 'ru'
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
