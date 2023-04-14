require_relative '../config/initailizers/dotenv'
require_relative 'shifter/exporter'
require_relative 'shifter/scraper'
require_relative 'shifter/parser'
require_relative 'shifter/version'
require_relative 'shifter/channels'

require 'debug'
require 'rspotify'

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

puts Shifter.env
puts Shifter::Spotify::COMPANY

# authenticate for user erimicel via API
spotify = Shifter::Spotify.new(user: 'erimicel')
# puts spotify.playlist(id: '6vlWxLitVim5pvBzI7oZp6').export
# puts AppleMusic::Artist.search('Men I Trust').first
