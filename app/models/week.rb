class Week < ApplicationRecord
  belongs_to :year
  has_many :renters
end
