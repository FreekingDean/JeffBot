ENV['RACK_ENV'] = 'test'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require './config/application'