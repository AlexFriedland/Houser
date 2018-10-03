module HousesHelper
  def all_years(user)
    year_arr = []
    user.houses.each do |h|
      h.years.each do |y|
        year_arr << y.year
      end
    end
    year_arr.uniq!
    binding.pry
  end
end
