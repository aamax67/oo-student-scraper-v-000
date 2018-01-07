require 'nokogiri'
require 'open-uri'


index_url = Nokogiri::HTML(open("./fixtures/student-site/index.html"))

class Scraper

  def self.scrape_index_page(index_url)
    
    doc.css(".card-text-container").text
                
  end

  def self.scrape_profile_page(profile_url)

  end

end
