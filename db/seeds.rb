# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = User.new
user.username = "jack"
user.email = "jack@example.com"
user.password = "11111111"
user.password_confirmation = "11111111"
user.avatar_url = "https://graph.facebook.com/jack.mallers/picture"
user.save

user = User.new
user.username = "mdub"
user.email = "mdub@test.com"
user.password = "password"
user.password_confirmation = "password"
user.avatar_url = "https://graph.facebook.com/michael.weimann/picture"
user.save

puts "There are now #{User.count} users."

group = Group.new
group.group_name = "600SEast"
random_user = User.offset(rand(User.count)).limit(1).first
group.creator_id = random_user.id
group.save

puts "There are now #{Group.count} groups."

membership = Membership.new
membership.user_id = user.id
membership.group_id = group.id
membership.save

puts "There are now #{Membership.count} memberships."

tool_hashes = [
  { :tool_name => "Rototiller", :available => "true" },
  { :tool_name => "Lawn Mower", :available => "true" },
  { :tool_name => "Weed Whacker", :available => "true" },
  { :tool_name => "Spork", :available => "true" },
  { :tool_name => "Snowblower", :available => "true" },
  { :tool_name => "Pressure Washer", :available => "true" },
  { :tool_name => "Canopy", :available => "true" },
]

tool_hashes.each do |tool_hash|
  tool = Tool.new
  tool.tool_name = tool_hash[:tool_name]

  random_user = User.offset(rand(User.count)).limit(1).first
  tool.user_id = random_user.id
  tool.save
end

puts "There are now #{Tool.count} tools."
