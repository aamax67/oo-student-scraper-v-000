require 'nokogiri'
require 'open-uri'


class Scraper

    index_url = Nokogiri::HTML(open("./fixtures/student-site/index.html"))

  def self.scrape_index_page(index_url)

    index_url.css(".card-text-container").text

  end

  def self.scrape_profile_page(profile_url)

  end

end
