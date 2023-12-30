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
  # filename = "data/combined.json.gz"
  filename = "data/combined.jgz"
  send_file filename, type: :jgz, disposition: 'attachment'
end
