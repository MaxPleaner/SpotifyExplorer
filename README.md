# SpotifyExplorer
https://spotify-explorer.dissonant.info

# Background

Spotify publishes a lot of AI-generated content under "Particle Detector" accounts, but it's a little hard to navigate through,
since you can't just browse it all on their app.

So, using Spotify's Web API I scraped all the playlists from these Spotify users:

- "particleintroductor",
- "thesoundsofspotify",
- "particledetector",
- "particledetector2023"

under which are many playlists for exploring music from a particular region or genre.

I then made a little Sinatra app wrapper which serves the playlists from static JSON files and does a bit of client-side grouping. It also provides a search bar. 

Hosted at https://spotify-explorer.dissonant.info

# Usage

1. Run `bundle`
2. To run scraper, first copy `.env.example` to `.env` and enter your Spotify Developer API credentials there (create a Web API project), Then run `ruby -r './scraper.rb' -e 'get_playlists'`. This will save some static JSON files which are used by the server.
3. To run server, `env RACK_ENV=production rackup -p 9294` (change port num as needed)

# Architecture

It's just a simple Sinatra server behind Rack. All frontend stuff is in one file `root.slim`. It uses Slim, Sass, and Coffeescript for the HTML, CSS, and JS respectively. I know these variants aren't very popular any more, but get the hang of them and maybe you'll fall in love like I did. And Sinatra / Slim makes it so damn easy. Of course, it requires a web server, but if you're cool with that it's really plug-n-play, no preprocessor setup or anything.