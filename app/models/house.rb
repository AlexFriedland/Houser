class House < ApplicationRecord
  has_many :expenses
  has_many :years

  def total_income
    #add all payments
    total_income - total_expenses
  end

end
