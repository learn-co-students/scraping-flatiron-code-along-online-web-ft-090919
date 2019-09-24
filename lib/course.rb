

  class Course

    attr_accessor :title, :schedule, :description, :class, :post

    @@all = []

    def initialize
      @@all << self
      self
    end


    def self.all
      @@all
    end

    def self.reset_all
      @@all.clear
    end

  end
