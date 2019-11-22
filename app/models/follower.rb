class Follower
    attr_accessor :age

    @@all = []
    def initialize(name, life_motto)
        @name = name
        @life_motto = life_motto

        @@all << self
    end

    def cults

    end

    def join_cult

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