class Follower
    attr_accessor :age

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
end