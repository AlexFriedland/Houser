class Week < ApplicationRecord
  belongs_to :year

  has_many :week_renters
  has_many :renters, :through => :week_renters

  has_many :deposits
  has_many :rincomes



  def total_income
    total_income = 0
    self.rincomes.each {|rincome|
      total_income += rincome.amount if rincome.amount > 0
    }
    total_income
  end

end
