require 'dotenv'
require 'byebug'
require 'json'

Dotenv.load

CLIENT_ID = ENV.fetch("CLIENT_ID")
CLIENT_SECRET = ENV.fetch("CLIENT_SECRET")

# We will scrape these users' playlists
USERS = [
  # "particleintroductor",
  # "thesoundsofspotify",
  # "particledetector",
  "particledetector2023"
]

def get_access_token
  cmd = <<-SH
    curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
  SH

  JSON.parse(`#{cmd}`)["access_token"]
end

def get_playlists
  token = get_access_token
  results = []

  USERS.each do |user_id|
    url = "https://api.spotify.com/v1/users/#{user_id}/playlists?limit=50"

    loop do
      puts "fetching #{url}"
      cmd = <<-SH
        curl "#{url}" \
            -H "Authorization: Bearer  #{token}"
      SH
      result = JSON.parse(`#{cmd}`)
      results << result
      url = result["next"]
      break if url.nil?
    end

    items = results.map { |r| r["items"] }.flatten
    data = items.map do |item|
      {
        name: item["name"],
        uri: item["uri"],
        image: item["images"].first["url"],
        owner: item["owner"]["id"],
      }
    end

    File.open("data/#{user_id}.json", "w") do |f|
      f.write(data.to_json)
    end
  end

  results
end