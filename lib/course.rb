class Course
  
  attr_accessor :title, :schedule, :description
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @@doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    @@courses = @@doc = doc.css("h2")
  end
  
  def make_courses
    @@courses.each do |course|
      Course.new(course)
    end
  end
  
end

