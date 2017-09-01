ENV['RACK_ENV'] = 'test'
ENV['RAILS_ENV'] = 'test'

require './config/application'
require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :transaction
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
