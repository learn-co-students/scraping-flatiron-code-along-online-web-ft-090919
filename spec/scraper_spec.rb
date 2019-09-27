require_relative './spec_helper'
require_relative '../lib/scraper.rb'

describe "Scraper" do

  let(:scraper) {Scraper.new}

  describe "#get_page" do
    it "uses Nokogiri to get the HTML from a web page" do
      doc = scraper.get_page
      expect{scraper.get_page}.to_not raise_error
      expect(doc).to be_a(Nokogiri::HTML::Document)
    end
  end

  before(:each) do
    Course.reset_all
  end

  describe "#get_courses" do
    it "uses a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping" do
      course_offerings = scraper.get_courses
      expect(course_offerings.class).to be(Nokogiri::XML::NodeSet)
      expect(course_offerings.empty?).not_to be(true)
      course_offerings.each do |course_offering|
        expect(course_offering).to be_a(Nokogiri::XML::Element)
        expect{course_offering.css("h2").text}.to_not raise_error
      end
    end
  end

  

end
