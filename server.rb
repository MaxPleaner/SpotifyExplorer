require 'sinatra'
require 'slim'
require 'byebug'

get '/' do
  slim :root
end

get '/data' do
  content_type 'application/json'
  headers['Content-Encoding'] = 'gzip'
  send_file 'data/combined.json.gz', type: :json, disposition: 'attachment'
  # send_file('./data/combined.json.gz', filename: "data.gz")
end
