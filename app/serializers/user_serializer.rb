class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :email, :bio, :image
    has_many :haikus
    has_many :followers
    has_many :followees
end