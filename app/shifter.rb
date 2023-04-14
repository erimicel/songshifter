require_relative '../config/initailizers/dotenv'
require_relative 'shifter/exporter'
require_relative 'shifter/scraper'
require_relative 'shifter/parser'
require_relative 'shifter/downloader'
require_relative 'shifter/version'
require_relative 'shifter/channels'

require 'debug'
require 'rspotify'
require 'ruby-progressbar'

# SongShifter base module
module Shifter
  class << self
    def env
      ENV['ENVIRONMENT']
    end

    def root
      File.expand_path('..', __dir__)
    end

    def tmp
      File.join(root, 'tmp')
    end
  end
end

# authenticate for user erimicel via API
spotify = Shifter::Spotify.new(user: 'erimicel')

# Export playlist to CSV and download thumbnail image
spotify.playlist(id: '6vlWxLitVim5pvBzI7oZp6').export

# TODO: add examples
# TODO: add user prompt for playlist ID or action
# TODO: add apple music fetcher
