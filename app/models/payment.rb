class Payment < ApplicationRecord
  has_many :rincomes
  has_many :weeks, through: :rincomes
end
