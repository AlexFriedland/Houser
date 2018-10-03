class YearsController < ApplicationController

  def new
    @year = Year.new
  end

  def create
    @house = House.new(house_params)
    #if house saves,
    if @house.save
      @user = User.find(session[:user_id])

      #logic to find + create new years
      x = params[:house][:year_ids]
      x[0] = "0"
      x.each do |id|
        y = Year.find_by_id(id)
        if y != nil
          @house.years << Year.create!(house_id: @house.id, year: y.year, total_income: 0)
        end
      end

      @user.houses << @house
      binding.pry
      redirect_to houses_path
    else
      render 'house/new'
    end
  end

  def show
    @year = Year.find(params[:id])
  end

  def update
    @year = Year.find(params[:id])
    @year.update(year_params)
    redirect_to artist_path(@year)
  end
end
