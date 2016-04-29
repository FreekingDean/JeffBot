# require config files
Dir['./config/*.rb'].each { |file| require file }

# require initializers
Dir['./config/initializers/*.rb'].each { |file| require file }
