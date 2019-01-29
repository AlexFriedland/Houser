class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :notes, :payment_type, :rincome_id

  # unneeded?
  has_many :rincomes, serializer: RincomeSerializer

  # has_many through
  has_many :weeks, serializer: RincomeSerializer
end
