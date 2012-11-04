require 'bundler/setup'
Bundler.require

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each {|d| require d}

require 'minitest/autorun'

ENV['RACK_ENV'] = 'test'
