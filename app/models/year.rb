class Year < ApplicationRecord
  belongs_to :house
  has_many :weeks

end
