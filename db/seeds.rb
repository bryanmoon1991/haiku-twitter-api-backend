# require 'httparty'
# require 'JSON'


# 200.times do 

#     response = HTTParty.get('https://api.thecatapi.com/v1/images/search')
#     image = JSON.parse(response.body)[0]['url']

#     User.create(username:Faker::Twitter.screen_name, email:Faker::Internet.email, password:"password", bio:Faker::Quote.famous_last_words, image: image)
# end

# 1000.times do
#     follower = User.all.sample
#     followee = (User.all - [follower]).sample
#     Relationship.create(follower_id: follower.id, followee_id: followee.id)
# end



# 2000.times do
#     Haiku.create(first:"test one two three test", second:"this is just a test poem", third:"i repeat, a test", user: User.all.sample)
# end


# 20.times do
#     User.all.each do |user|
#         haiku = (Haiku.all - user.favorites).sample
#         Favorite.create(haiku: haiku, user: user) 
#     end
# end





# after you create new user for your self run db:seed with below and comment out above



# i = 0
# 50.times do
#     Relationship.create(follower_id: i, followee_id: 194)
#     i += 1
# end

# j = 0
# 50.times do
#     Relationship.create(follower_id: 194 , followee_id: j)
#     j += 1
# end

# 50.times do
#     Haiku.create(first:"test one two three test", second:"this is just a test poem", third:"i repeat, a test", user_id: 194)
# end


# 75.times do
#     haiku = (Haiku.all - User.last.favorites).sample
#     Favorite.create(haiku: haiku, user_id: 194) 
# end
