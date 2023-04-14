require 'csv'

module Shifter
  #This code is designed to provide a simple interface for exporting data to a CSV file.
  # The CSV library is used to write the data to a CSV file with the given file name.
  class Exporter
    def initialize(data: {}, file_name: 'output')
      @data = data
      @file_name = file_name
      @kind = 'csv'

      validate_data
    end

    def export
      return if @data.empty?

      case @kind
      when 'csv'
        export_to_csv
      end
    end

    private

    def validate_data
      raise 'Data must be an array of hashes' unless @data.is_a?(Array) && @data.first.is_a?(Hash)
    end

    def export_to_csv
      CSV.open("tmp/#{@file_name}.csv", 'w') do |csv|
        csv << @data.first.keys
        @data.each do |row|
          csv << row.values
        end
      end
    end
  end
end
