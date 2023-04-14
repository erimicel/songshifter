require 'open-uri'

module Shifter
  # This code is designed to provide a simple interface for fetching the HTML
  # content of a given URL using the open-uri library.
  class Scraper
    # This method is called when a new instance of the class is created.
    # It takes a single argument url and assigns it to an instance variable @url.
    # It also raises an error if the @url instance variable is not set.
    def initialize(url:)
      @url = url

      raise 'URL is not set' unless @url
    end

    def html
      @html ||= URI.open(@url)
    end
  end
end
