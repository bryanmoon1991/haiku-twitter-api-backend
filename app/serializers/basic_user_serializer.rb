class BasicUserSerializer < ActiveModel::Serializer
    # root :user
    attributes :id, :username, :email, :bio, :image, :name

end