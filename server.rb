require 'sinatra'
require 'slim'
require 'byebug'

get '/' do
  # @data = File.read('data/combined.json')
  slim :root
end

get '/data' do
  content_type 'application/json'
  headers['Content-Encoding'] = 'gzip'
  send_file 'data/combined.json.gz', type: :json, disposition: 'attachment'
end
