class Cult
    attr_reader :name, :location, :founding_year, :slogan
    
    @@all = []
​
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
​
        @@all << self
    end
​
    def recruit_follower(follower)
        # Date format: YYYY-MM-DD
        time = Time.new
        initiation_date = time.to_s.split[0]
        BloodOath.new(initiation_date, self, follower)
    end
    
    def cult_population
        followers = BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
        selected_bloodoaths.map do |blood_oath|
            blood_oath.follower
    end
​
    def self.all
        @@all
    end
​
    def self.find_by_name(cult_name)
        @@all.find do |cult| 
            cult.name == cult_name
        end
    end
​
    def self.find_by_location(cult_location)
        @@all.find do |cult|
            cult.location == cult_location
        end
    end
​
    def self.find_by_founding_year(year)
        @@all.find_all do |cult|
            cult.founding_year == year
        end
    end
end
