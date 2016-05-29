require 'active_record'
require 'active_support'
require 'active_support/core_ext'
require 'bunny'
require 'pry'

# require config files
Dir["#{File.dirname(__FILE__)}/../config/*.rb"].each do |file|
  require file
end

# require initializers
Dir["#{File.dirname(__FILE__)}/../config/initializers/*.rb"].each do |file|
  require file
end

# require app files
Dir["#{File.dirname(__FILE__)}/../app/**/*.rb"].each do |file|
  next if file.include?('app/main.rb')
  require file
end

# This is the main application and holds all the keys
class App
  class << self
    attr_accessor :logger
  end
end
