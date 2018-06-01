class RentalIncome < ApplicationRecord
  belongs_to :week
  has_many :payments
end
