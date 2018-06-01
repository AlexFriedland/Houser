class Income < ApplicationRecord
  belongs_to :house
  has_many :years
end
