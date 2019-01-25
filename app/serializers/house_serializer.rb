class HouseSerializer < ActiveModel::Serializer
  attributes :id, :info, :market_value, :name, :purchase_price, :total_expenses, :total_income, :value

  has_many :expenses, serializer: ExpenseSerializer
  has_many :years, serializer: YearsSerializer
  has_many :user, serializer: UserSerializer

  # accepts_nested_attributes_for :years ?
end
