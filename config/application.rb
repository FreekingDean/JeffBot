require 'active_record'
require 'active_support'
require 'active_support/core_ext'
require 'bunny'

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
  next if file.contains?('app/main.rb')
  require file
end
