# Load the Rails application.
require_relative 'application'

Rails.application.config.hosts << ENV['HOST_NAME']

# Initialize the Rails application.
Rails.application.initialize!
