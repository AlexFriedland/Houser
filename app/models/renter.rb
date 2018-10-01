class Renter < ApplicationRecord

  has_many :weeks, through: :week_renters
end
