class WeekSerializer < ActiveModel::Serializer
  attributes :id, :closed?, :date, :misc_charges, :notes

  has_many :renters, serializer: WeekRenterSerializer
  has_many :deposits, serializer: DepositSerializer
  has_many :payments, serializer: RincomeSerializer
end
