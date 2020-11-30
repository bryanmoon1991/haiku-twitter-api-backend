class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :email, :bio, :image, :name
    has_many :haikus
    has_many :followers
    has_many :followees
    has_many :favorites
    has_many :followed_users
end