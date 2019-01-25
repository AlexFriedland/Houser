class RenterSerializer < ActiveModel::Serializer
  attributes :id, :address, :name, :notes

  # has_many through
  has_many :weeks, serializer: WeekRenterSerializer
end
