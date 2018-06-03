class House < ApplicationRecord
  has_many :expenses
  has_many :years

  #change this to calc from DB seed
  def show_total_income

    self.years.each do |year|
      self.total_income += year.total_income
    end
    total_income
  end


end
