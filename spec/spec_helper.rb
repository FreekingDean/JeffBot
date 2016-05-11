ENV['RACK_ENV'] = 'test'
#require 'codeclimate-test-reporter'
require 'simplecov'
SimpleCov.start

require './config/application'
