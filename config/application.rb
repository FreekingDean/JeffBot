require 'active_record'
require 'active_support'
require 'active_support/core_ext'

# require config files
Dir['./config/*.rb'].each { |file| require file }

# require initializers
Dir['./config/initializers/*.rb'].each { |file| require file }

# require app files
Dir['./app/**/*.rb'].each { |file| require file }
