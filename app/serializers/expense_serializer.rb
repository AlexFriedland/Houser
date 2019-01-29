class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :notes

  belongs_to :house, serializer: HouseSerializer
end
