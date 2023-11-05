require 'sinatra'
require_relative './lib.rb'
require 'json'
require 'slim'
require 'byebug'

data = Dir.glob("./data/*.json").map do |file|
  JSON.parse(File.read(file))
end
# byebug
COMBINED_DATA = data.flatten

get '/' do
  slim :root
end

get '/data' do
  content_type :json
  COMBINED_DATA.to_json
end
