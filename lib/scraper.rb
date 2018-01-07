require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_index_page(index_url)

    index_url = Nokogiri::HTML(open("./fixtures/student-site/index.html"))

    index_url.css(".student-name").first.css("h4").text
binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
