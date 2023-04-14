
require 'down'

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

      def download_image
        Down.download(image, destination: "tmp/#{PREFIX}#{@playlist.name}.png")
      end

      def export
        self.download_image
        Shifter::Exporter.new(data: serialize_tracks, file_name: "#{PREFIX}#{@playlist.name}").export
      end

      private

      def serialize_tracks
        tracks.map do |track|
          {
            name: track.name,
            artists: track.artists.map(&:name).join(', '),
            album: track.album.name,
            duration: track.duration_ms,
            explicit: track.explicit,
            popularity: track.popularity,
            preview_url: track.preview_url,
            uri: track.uri
          }
        end
      end
    end
  end
end
