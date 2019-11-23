class Cult
    attr_reader :name, :location, :founding_year, :slogan
    
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def recruit_follower(follower)
        # Date format: YYYY-MM-DD
        time = Time.new
        initiation_date = time.to_s.split[0]
        BloodOath.new(initiation_date, self, follower)
    end
    
    def followers
        BloodOath.all.select {|blood_oath| blood_oath.cult == self}
    end

    def cult_population
        followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        @@all.find do |cult| 
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
        @@all.find do |cult|
            cult.location == cult_location
        end
    end

    def self.find_by_founding_year(year)
        @@all.find_all do |cult|
            cult.founding_year == year
        end
    end

    def average_age
        age_sum = followers.reduce(:+) {|follower| follower.age}
        age_sum.to_f / cult_population
    end

    def followers_mottos
        followers.map{|follower| follower.life_motto}
    end

    def self.least_popular
        populations = self.all.map {|cult| cult.cult_population}
        least_population = populations.min
        self.all.find {|cult| cult.cult_population == least_population}
    end

    def self.most_common_location
        locations = self.all.map {|cult| cult.locations}
        frequency = locations.reduce(Hash.new(0)) {|hash, location| hash[location] += 1; hash}
        max = frequency.values.max
        frequency.find {|location, freq| freq == max}
    end

end