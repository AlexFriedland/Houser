class DepositSerializer < ActiveModel::Serializer
  attributes :id, :amount, :notes, :returned

  belongs_to :week, serializer: WeekSerializer
end
