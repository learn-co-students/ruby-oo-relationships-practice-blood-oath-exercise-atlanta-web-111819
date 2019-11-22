class Follower
     
    @@all = []

    attr_reader :name, :age, :life_motto
    attr_accessor :cults

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self 
    end


    def join_cult(cult, date)
        BloodOath.new(cult, self, date)
    end

    def cult_count
        BloodOath.all.select{|oath| oath.follower == self}.length
    end

    def self.all
        @@all
    end

    def of_a_certain_age(age)
        @@all.select{|follower| follower.age >= age}
    end

    def my_cults_slogan
        BloodOath.all.select{|oath| oath.follower == self}.each do |cult|
            puts cult.slogan 
        end
    end

    def most_active
        temp = nil
        @@all.each do |follower|
            if temp == nil
                temp = follower
            elsif BloodOath.all.select{|oath| oath.follower == temp}.length < BloodOath.all.select{|oath| oath.follower == follower}.length
                temp = follower
            end
        end
        return temp
    end

    def top_ten
        @@all.sort{|follower| self.cult_count}.slice(0, 10)
    end
end
