class House < ApplicationRecord
  has_many :expenses
  has_many :years

  #change this to calc from DB seed
  def show_total_income
    self.years.each do |year|
      year.weeks.each do |week|
        week.rincomes.each do |rincome|
          if rincome.amount != nil
            binding.pry
            self.total_income += rincome.amount
          end
        end
      end
    end
  end


end
