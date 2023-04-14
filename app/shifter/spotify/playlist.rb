
module Shifter
  module Spotify
    class Playlist
      PREFIX = 'SPOTIFY_playlist_'.freeze

      attr_reader :playlist

      def initialize(user:, id:)
        @playlist ||= RSpotify::Playlist.find(user, id)
      end

      def name
        @playlist.name
      end

      def description
        @playlist.description
      end

      def tracks
        @playlist.tracks
      end

      def image
        @playlist.images.first['url']
      end

      def export
        puts "Downloading image for '#{name}'"
        puts "Exporting tracks for '#{name}"

        init_progressbar

        self.download_image

        Shifter::Exporter.new(data: serialize_tracks, file_name: "#{PREFIX}#{name}").export
      end

      private

      # total: tracks.count + 1 because we also download the image
      def init_progressbar
        @progressbar = ProgressBar.create(total: tracks.count + 1)
      end

      def download_image
        Down.download(image, destination: "tmp/#{PREFIX}#{name}.png")

        @progressbar.increment
      end

      def serialize_tracks
        arr = []

        tracks.each do |track|
          arr << {
            name: track.name,
            artists: track.artists.map(&:name).join(', '),
            album: track.album.name,
            # duration: track.duration_ms,
            # explicit: track.explicit,
            # popularity: track.popularity,
            # preview_url: track.preview_url,
            # uri: track.uri
          }

          @progressbar.increment
        end

        arr
      end
    end
  end
end
