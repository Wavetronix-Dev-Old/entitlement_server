require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
require "database_cleaner"

Dir[File.expand_path("test/support/**/*.rb")].each { |file| require file }
Dir[File.expand_path("test/factories/**/*.rb")].each { |file| require file }

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)

OmniAuth.config.test_mode = true

identity_hash = {
  provider: "identity",
  uid: "9372",
  info: {
    first_name: "Bob",
    last_name: "Billy",
    email: "bibblybob@bob.com"
  }
}

OmniAuth.config.add_mock(:identity, identity_hash)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end
end
