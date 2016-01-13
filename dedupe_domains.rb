#!/usr/bin/env ruby
#Takes a sorted list of URLs and lists each one once only (i.e. no duplicates)
class Deduper
  def initialize (filename)
    @filename = filename
  end

  def group_rows
    previous = ""
  	File.readlines(@filename).each do |row|
      row.strip!
      row.chomp!("/")
  	  puts row unless row == previous
      previous = row
  	end
  end
end


ex = Deduper.new(ARGV[0])
ex.group_rows

#ruby extract_urls.rb urls_list.txt
#ruby extract_urls.rb urls_list.txt