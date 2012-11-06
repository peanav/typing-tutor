require 'open-uri'
require 'yaml'
require 'json'

class KatalusApp < Sinatra::Base

  get '/' do
    sentences = YAML.load_file('data/sentences.yml').sort_by { rand(100) }.shift(3)
    @sentences = sentences.map {|s| {sentence: s} }
    slim :index
  end

  get '/voice' do
    content_type 'audio/mpeg'
    ua = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24"
    open("http://translate.google.com/translate_tts?tl=en&q=#{URI::encode params['q']}", "User-Agent" => ua).read
  end

  get '/styles/*.css' do |sheet_name|
    content_type :css
    less :"less/#{sheet_name}", :paths => ['views/less', 'vendor/bootstrap/less']
  end

  get '/scripts/*.js' do |script_name|
    coffee :"/coffee/#{script_name}", :bare => true
  end

end
