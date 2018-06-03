class YearsController < ApplicationController

  def new
    @year = Year.new
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
