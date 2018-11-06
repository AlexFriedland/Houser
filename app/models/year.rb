class Year < ApplicationRecord
  validates :year, presence: true

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

  def self.outstanding
    where("total_income > 100000")
  end

  def self.years
    where("year > 1")
  end

  def self.years_and_mine
    x = []
    years.each do |y|
      if y.house.user_id = session[:user_id]
        x << y
      end
    end
  end

  
  #current_user.id
  def self.mine
    where(year: year.house.user.user_id = session[:user_id])
  end

  def self.my_years
    @user = User.find_by_id(session[:user_id])
    @houses = House.all

    where(
      @houses.each do |house|
        house.user.user_id = session[:user_id]
      end
    )
  end

end
