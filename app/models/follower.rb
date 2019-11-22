class Follower
    attr_reader :name, :age, :life_motto
​
    @@all = []
    def initialize(name, life_motto, age)
        @name = name
        @life_motto = life_motto
        @age = age
​
        @@all << self
    end
​
    def cults
​       blood_oath = BloodOath.all
       blood_oaths.select do |blood_oath|
       blood_oath.follower == self 
    end
​
    def join_cult(cult)
​    time = Time.new
    initiation_date = time.to_s.split[0]
    BloodOath.new(initiation_date, cult, self)
    end
​
    def self.all
        @@all
    end
​
    def self.of_a_certain_age(age)
        @@all.find_all do |follower|
            follower.age >= age
    end
    def average_age
        self.followers.map{|followers| followers.age}
        ages.reduce(:+) / self.cult_population.to_f
    end
end