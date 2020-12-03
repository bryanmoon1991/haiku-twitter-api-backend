# require 'httparty'
# require 'JSON'

# 200.times do 
#     response = HTTParty.get('https://api.thecatapi.com/v1/images/search')
#     image = JSON.parse(response.body)[0]['url']
#     User.create(username:Faker::Twitter.screen_name, name:Faker::Name.name, email:Faker::Internet.email, password:"password", bio:Faker::Quote.famous_last_words, image: image)
# end

# puts "created Users"

# 1000.times do
#     follower = User.all.sample
#     followee = (User.all - [follower] - [follower.followees]).sample
 
#     Relationship.create(follower_id: follower.id, followee_id: followee.id)
# end

# puts "created Relationships"

haikus = [
    "Haiku for you all, Single click gives random one, Hope it brings you joy",
    "Winter shrouds hungry, Grain of salt emerged at last, Beauty of friendship",
    "Garbage of lost ruins, Hush of wind adapts to all, Barter in my mind",
    "Slumber of ages, Open door assaults the air, Balloon drifts untrue",
    "Rainfall at the sea, Sparkling star is hypnotized, Menace of a star",
    "Speeches of the spring, Leafing tree now understands, Crumbling of the spring",
    "Wolf howls awoken now, Hush of wind destined to pass, Boats drift music plays",
    "Hinder at the sea, Hidden smile overcome with joy, World spins turn around",
    "Expanding music, Sweet chorus as time returns, Path runs back and forth",
    "Fields wave in the wind, Sparkling star prepares for fate, Years pass far away",
    "Markets spread selfish, Hush of wind answers to none, World spins from the East",
    "Bird flies close to heart, Turn to ash as echoes pass, River flows at dawn",
    "Beauty intertwined, Midday heat commanding me, Dreaming of balance",
    "Boats drift softly still, Tiny joys between the stars, Beauty of yonder",
    "Forest grows sudden, Midday heat drinks life's essence, Hear beats from the sky",
    "Enduring houses, Mirror lake resigned to fate, Ice wraps wait and see",
    "Leaves drift gently yet, Cooling down and sweet goodbyes, Echoes of nature",
    "Bread shared time to time, Snake in grass focused on good, Falling of the dead",
    "Armies march weary, Hush of wind caressed by love, Ice wraps with relief",
    "Sunshine of ages, Happy thoughts until you're back, Eyes dart back and forth",
    "Rewards of autumn, Firefly glances quickly, Stories told in light",
    "Shining of ventures, Quivered breath without support, Candles sway quickly",
    "Children laugh onward, Rain of spring brings joy once more, Flowers wave slowly",
    "Progressing knowledge, Treasure trove stay very close, Barter of a star",
    "Nature grows timely, Tranquil peace for spirits loved, Baby crawls quiet",
    "Undoing respect, Sweetest taste with answers found, Boats sailing timely"
]



# 1000.times do
#     Haiku.create(first:haikus.sample.split(", ")[0], second:haikus.sample.split(", ")[1], third:haikus.sample.split(", ")[2], user: User.all.sample)
# end

# puts "created Haikus"


# 20.times do
#     User.all.each do |user|
#         haiku = (Haiku.all - user.favorites).sample
#         Favorite.create(haiku: haiku, user: user) 
#     end
# end

# puts "created Favorites"



# after you create new user for your self run db:seed with below and comment out above


puts "created main user"

i = 0
50.times do
    Relationship.create(follower_id: i, followee_id: 195)
    i += 1
end

puts "created main user followers"

j = 40
50.times do
    Relationship.create(follower_id: 195 , followee_id: j)
    j += 1
end

puts "created main user followees"

50.times do
    Haiku.create(first:haikus.sample.split(", ")[0], second:haikus.sample.split(", ")[1], third:haikus.sample.split(", ")[2], user_id: 195)
end

puts "created main user haikus"

75.times do
    haiku = (Haiku.all - User.last.favorites).sample
    Favorite.create(haiku: haiku, user_id: 195) 
end

puts "created main user favorites"