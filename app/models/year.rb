class Year < ApplicationRecord
  belongs_to :income
  has_many :weeks
end
