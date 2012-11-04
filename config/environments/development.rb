Sinatra::Base.configure do |c|
  c.set :js_app, {
    src: '/scripts/require.js',
    data_main: '/scripts/main.js'
  }
end
