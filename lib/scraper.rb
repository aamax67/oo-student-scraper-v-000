require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_index_page(index_url)

    index_url = Nokogiri::HTML(open(index_url))

        students = []

      index_url.css("div.roster-cards-container").each do |card|
        card.css(".student-card a").each do |student|
      student_name = student.css(".student-name").text
      student_location = student.css(".student-location").text
      student_profile_link = "#{student.attr('href')}"
      students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)

      profile_url = Nokogiri::HTML(open(profile_url))

        student_profiles = {}

      links = profile_url.css(".social-icon-container").children.css("a").map {|el| el.attribute("href").value}

        links.each do |link|

        if links.include?("linkedin")
          student_profiles[:linkedin] = link
        elsif links.include?("github")
          student_profiles[:github] = link
        elsif links.include?("twitter")
          student_profiles[:twitter] = link
        else
          student_profiles[:blog] = link
        end
      end
      student_profiles
    end
  end
