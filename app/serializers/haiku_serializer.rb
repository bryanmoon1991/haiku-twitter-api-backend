class HaikuSerializer < ActiveModel::Serializer
  attributes :id, :user, :first, :second, :third
end
