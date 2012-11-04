group :test do
  guard :minitest do
    watch(%r|^spec/.+_spec\.rb|)
    watch(%r|^lib/(.+)\.rb$|)           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r|^spec/spec_helper\.rb|)    { "spec" }
    watch(%r|^spec/integration_helper\.rb|)    { "spec" }
  end
end

group :run do
  require 'launchy'

  guard :process, :name => 'foreman', :command => 'bundle exec thin start -p 5000' do
    watch(%r|^lib/(.+)\.rb$|)
    watch(%r|^modules/(.+)\.rb$|)
  end

  guard :livereload do
    watch(%r{public/scripts.+\.(js|html|mustache)})
    watch(%r{views/coffee.+\.(coffee)})
  end

  if(ARGV.include?('-o'))
    Thread.new do
      sleep(2)
      Launchy.open 'http://localhost:5000/'
      Launchy.open 'http://localhost:5000/scripts/test/runner.html'
    end
  end
end

