class BloodOath
    @@all = []
    attr_reader :cult, :follower
    
    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        oaths = Array.new(self.all)
        oaths.sort_by! {|oath| oath.initiation_date}
        oaths[0]
    end
end