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

    def first_oath
        @@all.select{|oath| oath.initiation_date.split("-")[0].max && oath.initiation_date.split("-")[2].max && oath.initiation_date.split("-")[4].max}
    end
end