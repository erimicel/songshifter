require 'nokogiri'

module Shifter
  # This code is designed to provide a simple interface for parsing the HTML
  # content of a given HTML string using the Nokogiri library.
  class Parser
    def initialize(html:)
      @html = html
    end

    # This method returns the parsed HTML content of the @html instance variable.
    # If the @document instance variable is already set, it returns it. Otherwise,
    # it uses the Nokogiri library to parse the HTML content of the @html instance variable and sets
    # the @document instance variable to the parsed content.
    def document
      @document ||= Nokogiri::HTML(@html)
    end
  end
end
