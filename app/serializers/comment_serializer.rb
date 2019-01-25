class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :date
  belongs_to :user, serializer: UserSerializer
end
