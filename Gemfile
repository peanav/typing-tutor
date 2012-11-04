source :rubygems

gem 'rake', :require => false

gem 'sinatra', :require => 'sinatra/base'
gem 'sinatra-contrib', :require => 'sinatra/content_for'
gem 'slim'
gem 'less'
gem 'coffee-script'
gem 'tilt', :git => 'git://github.com/rtomayko/tilt.git'

gem 'therubyracer'
gem 'thin'

#required for heroku to let us use node to precompile js
gem 'execjs', :require => false

group :development, :test do
  gem 'guard', '~>1.0.0'
  gem 'guard-minitest'
  gem 'rack-test'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'guard-process'
  gem 'foreman'
  gem 'launchy'
end
