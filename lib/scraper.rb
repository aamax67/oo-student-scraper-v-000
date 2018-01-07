require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_index_page(index_url)

    index_url = Nokogiri::HTML(open("./fixtures/student-site/index.html"))

    students = []

    index_url.css(".student-name").each do |student|
      student_name = student.css(".student-name").text
      students << {name: student_name}
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
