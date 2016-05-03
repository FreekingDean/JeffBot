require "active_record"
require "active_support"
require "active_support/core_ext"
require "bunny"

# require config files
Dir["#{File.dirname(__FILE__)}/../config/*.rb"].each { |file| require file }

# require initializers
Dir["#{File.dirname(__FILE__)}/../config/initializers/*.rb"].each { |file| require file }

# require app files
Dir["#{File.dirname(__FILE__)}/../app/**/*.rb"].each { |file| require file }
