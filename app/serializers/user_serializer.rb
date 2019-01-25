class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :houses, serializer: HouserSerializer
  has_many :comments, serializer: CommentSerializer
end
