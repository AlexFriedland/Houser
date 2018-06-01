class Week < ApplicationRecord
  belongs_to :year
  has_many :renters
  has_many :deposits
  has_many :rincomes

end
