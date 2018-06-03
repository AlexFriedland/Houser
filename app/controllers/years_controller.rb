class YearsController < ApplicationController

  def new
    @year = Year.new
  end

  def show
    @year = Year.find(params[:id])
  end

  def update
    @year = Year.find(params[:id])
    @year.update(artist_params)
    redirect_to artist_path(@artist)
  end
end
