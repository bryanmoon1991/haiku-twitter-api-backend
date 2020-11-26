30.times do 
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