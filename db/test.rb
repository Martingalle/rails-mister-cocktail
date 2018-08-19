require 'nokogiri'
require 'open-uri'

url = "https://vinepair.com/articles/50-most-popular-cocktails-world-2017/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('h3').each do |element|
  element = element.text.strip.tr("0-9", "")
  puts element = element.tr(".", "")
end
