module UsersHelper

  def all_years(user)
    year_arr = []
    user.houses.each do |h|
      h.years.each do |y|
        year_arr << y.year
      end
    end
    binding.pry
    year_arr.uniq!
  end

end
