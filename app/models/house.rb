class House < ApplicationRecord
  has_many :expenses
  has_many :years

end
