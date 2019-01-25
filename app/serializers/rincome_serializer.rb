class RincomeSerializer < ActiveModel::Serializer
  attributes :id, :amount, :percentPaid

  belongs_to :week, serializer: WeekSerializer
  belongs_to :payment, serializer: PaymentSerializer
end
