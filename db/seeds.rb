100.times do 
    User.create(username:Faker::Name.middle_name, email:Faker::Internet.email, password:"password", bio:"test bio", image:"test")
end


User.all.each do |user|
    5.times do
        user.followers << User.all.sample
    end
end

50.times do
    Haiku.create(first:"test one two three test", second:"this is just a test poem", third:"i repeat, a test", user: User.all.sample)
end


75.times do
   Favorite.create(haiku: Haiku.all.sample, user: User.all.sample) 
end







# after you create new user for your self run db:seed with below and comment out above



# i = 0
# 50.times do
#     Relationship.create(follower_id: i, followee_id: <your id>)
#     i += 1
# end

# 50.times do
#     Haiku.create(first:"test one two three test", second:"this is just a test poem", third:"i repeat, a test", user_id: <your id>)
# end


# 75.times do
#    Favorite.create(haiku: Haiku.all.sample, user_id: <your id>) 
# end
