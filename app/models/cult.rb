require 'pry'

class Cult
    @@all = []

    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :followers

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end
    def recruit_follower(follower, date)
        BloodOath.new(self, follower, date)
    end

    def cult_population
        BloodOath.all.select{|oath| oath.cult == self}.length
    end

    def self.all
        @@all
    end

    def find_by_name(name)
        @@all.select{|cult| cult.name == name}
    end

    def find_by_location(location)
        @@all.select{|cult| cult.location == location}
    end

    def find_by_founding_year(year)
        @@all.select{|cult| cult.founding_year == year}
    end

    def average_age
        index = 0
        BloodOath.all.select{|oath| oath.cult == self}.each do |follower|
            index += follower.age 
        end

        return index/self.cult_population
    end

    def my_followers_mottos
        BloodOath.all.select{|oath| oath.cult == self}.each do |follower|
            puts follower.life_motto
        end
    end

    def least_popular
        temp = nil
        @@all.each do |cult|
            if temp == nil
                temp = cult
            elsif temp.cult_population < cult.cult_population
                temp = cult
            end
        end
        return temp
        
    end

    def most_common_location
        # locations = []
        @@all.collect{|cult| cult.location}.mode

    end

end
