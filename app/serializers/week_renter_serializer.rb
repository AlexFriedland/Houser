class WeekRenterSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :week, serializer: WeekSerializer
  belongs_to :renter, serializer: RenterSerializer
end
