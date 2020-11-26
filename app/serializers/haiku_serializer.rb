class HaikuSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :first, :second, :third
end
