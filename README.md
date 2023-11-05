# SpotifyExplorer
https://spotify-explorer.dissonant.info

---

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
