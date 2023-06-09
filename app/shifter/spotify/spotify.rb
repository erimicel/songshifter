require_relative './playlist'

module Shifter
  module Spotify
    def self.new(user:)
      Spotify.new(user: user)
    end

    class Spotify
      def initialize(user:)
        @user = user

        authenticate
      end

      def playlist(id:)
        Playlist.new(user: @user, id: id)
      end

      private

      def authenticate
        RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
      end
    end
  end
end
