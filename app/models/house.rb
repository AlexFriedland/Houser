class House < ApplicationRecord
  has_many :expenses
  has_many :years
  belongs_to :user, optional: true

  accepts_nested_attributes_for :years


  #change this to calc from DB seed
  def show_total_income

    self.years.each do |year|
      if self.total_income
        self.total_income += year.total_income
      else
        total_income = 0
      end
    end
    total_income
  end

  def self.all_years
    year_arr = []
    Year.all.each do |y|
      year_arr << y.year
    end
    year_arr.uniq!
  end


end
