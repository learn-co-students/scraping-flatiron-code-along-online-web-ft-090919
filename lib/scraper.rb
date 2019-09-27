require 'pry'

require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @@doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    @@courses = @@doc.css("h1")
  end
  
  def make_courses
    course_text = []
    @@courses.each do |course|
      course_text << course.text.strip
    end
    course_text.each do |course|
      course = Course.new
    end
    binding.pry
  end
  
end



