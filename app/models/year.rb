class Year < ApplicationRecord
  belongs_to :house
  has_many :weeks

  def show_income
    income = 0
    self.weeks.each {|week|
      income += week.total_income
    }
    income = income + total_deposits +  #+ all misc charges
    income
  end

  #wait wat
  def total_misc
    i = 0
    self.weeks.each {|week|
      week.misc
    }
  end

  def total_deposits
    i = 0
    self.weeks.each {|week|
      week.deposits.each {|deposit|
        i += deposit.amount
      }
    }
    i
  end

end
