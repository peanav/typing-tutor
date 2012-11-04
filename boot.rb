APP_ROOT = File.dirname(__FILE__)
IS_HEROKU = !!ENV['SHARED_DATABASE_URL']
require 'bundler/setup'
Bundler.require

$: << File.join(File.dirname(__FILE__), 'lib')

#Add folder names of files to require for your app
%w{modules lib}.each do |n|
  Dir[File.expand_path("../#{n}/*.rb", __FILE__)].each {|f| require f}
end

require File.join(File.dirname(__FILE__), 'config', 'environment')
