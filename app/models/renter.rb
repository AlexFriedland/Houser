class Renter < ApplicationRecord
  has_many :week_renters
  has_many :weeks, :through => :week_renters
end
