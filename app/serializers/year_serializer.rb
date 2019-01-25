class YearSerializer < ActiveModel::Serializer
  attributes :id, :total_income, :value

  belongs_to :house, serializer: HouseSerializer
  has_many :weeks, serializer: WeekSerializer
end
