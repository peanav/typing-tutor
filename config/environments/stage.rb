Sinatra::Base.configure do |c|
  c.set :js_app, {src: '/scripts/main-built.js'}
end
