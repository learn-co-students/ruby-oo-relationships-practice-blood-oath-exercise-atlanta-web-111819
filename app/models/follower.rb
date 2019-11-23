class Follower
    attr_accessor :age
    attr_reader :name, :life_motto

    @@all = []
    def initialize(name, life_motto)
        @name = name
        @life_motto = life_motto

        @@all << self
    end

    def cults
        blood_oaths = BloodOath.all
        blood_oaths.select do |blood_oath|
            blood_oath.follower == self
        end
    end

    def join_cult(cult)
        # Date format: YYYY-MM-DD
        time = Time.new
        initiation_date = time.to_s.split[0]
        BloodOath.new(initiation_date, cult, self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.find_all do |follower|
            follower.age >= age
        end
    end

    def my_cults_slogans
        cults.map {|cult| cult.slogan}
    end

    def cult_count
        cults.count
    end

    def self.followers_with_cults
        self.all.map {|follower| [follower, follower.cult_count]}.to_h
    end

    def self.most_cults(followers)
        followers = Follower.followers_with_cults
        most_cults = followers.values.max
        followers.keys.find {|follower| follower.cult_count == most_cults}
    end

    def self.most_active
        self.most_cults(self.all)
    end

    def self.top_ten
        followers = Array.new(self.all)
        top_ten = []
        10.times do
            top_follower = self.most_cults(followers)
            top_ten << top_follower
            followers.delete(top_follower)
        end
        top_ten
    end
end