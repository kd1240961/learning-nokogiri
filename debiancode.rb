#!/usr/bin/env ruby

require 'open-uri'
require 'pp'
require 'nokogiri'

url = 'https://wiki.debian.org/DebianReleases'
html = open(url).read

# puts html
doc = Nokogiri::HTML.parse(html)
doc.at('//tbody').xpath('.//tr').each do |e|
  e.xpath('.//td').each do |f|
    print f.inner_text.ljust(25)
  end
  puts
end
