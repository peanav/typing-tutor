ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../boot', __FILE__)

require 'minitest/autorun'
require 'rack/test'

def app
  KatalusApp
end
