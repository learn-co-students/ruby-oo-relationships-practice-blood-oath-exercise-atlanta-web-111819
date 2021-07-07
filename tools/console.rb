require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

cult1 = Cult.new("Havens Gathering", "Atlanta", 1963, "Come Together")
cult2 = Cult.new("New Guys", "DC", 1976, "Call on us")
follower1 = Follower.new("Robert", 23, "I guess i can join a cult")
follower2 = Follower.new("Gary", 38, "Very bad hait gary")
follower3 = Follower.new("Zach", 19, "What am i doing")
follower4 = Follower.new("Eric", 30, "I am the last one")

cult1.recruit_follower(follower4, "1995-07-18")
cult1.recruit_follower(follower3, "2019-11-23")
cult1.recruit_follower(follower1, "2017-12-13")
cult2.recruit_follower(follower2, "2020-04-06")
cult2.recruit_follower(follower4, "2013-05-28")
cult2.recruit_follower(follower3, "2012-11-21")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits