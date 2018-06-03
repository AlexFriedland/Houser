class Year < ApplicationRecord
  belongs_to :house
  has_many :weeks

  def show_income
    income = 0
    self.weeks.each {|week|
      income += week.total_income
    }
    income
  end

end
