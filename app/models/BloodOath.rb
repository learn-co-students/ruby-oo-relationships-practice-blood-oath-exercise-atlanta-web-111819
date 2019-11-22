class BloodOath
    @@all =[]

    attr_reader :cult, :follower
    attr_accessor :initiation_date

    def initialize(cult, follower, initiation_date = "YYYY-MM-DD")
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        date = @@all.map{|oath| oath.initiation_date}.sort.last
        temp = @@all.select{|oath| oath.initiation_date == date}
        temp[0].follower
    end
end