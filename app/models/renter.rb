class Renter < ApplicationRecord
  belongs_to :week
  has_many :weeks
end
