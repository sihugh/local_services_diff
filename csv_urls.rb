#!/usr/bin/env ruby
#Extracts the Service URL column from the csv file
require "csv"

class UrlExtractor
	def initialize (csv_file)
		@fh = File.open(csv_file, 'r:Windows-1252:UTF-8')
	end

	def extract_urls
      CSV.new(@fh, headers: true).each do |row|
        url = row['Service URL'].downcase
        url.strip!
        url.chomp!
        puts url unless url == "x"
      end

	end
end
	
u = UrlExtractor.new("csvs/services.csv")
u.extract_urls
