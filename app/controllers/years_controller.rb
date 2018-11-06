class YearsController < ApplicationController

  def new
    @year = Year.new
    @house = House.find_by_id(params[:house_id])

  end

  def create

    @house = House.find_by_id(params[:house_id])

    @year = @house.years.build(year: params[:year][:year])
    #create year by name
    x = params[:year][:year]
    #x.to_i.is_a?(Integer) && x.length == 4 && params[:year][:house_id][1]
      if x.to_i.is_a?(Integer) && x.length == 4
        @year.save
        redirect_to house_path(@house)
      else
        @year.errors[:year] << " must be in proper format"
        binding.pry
        redirect_to new_house_year_path [@house, @year]
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
