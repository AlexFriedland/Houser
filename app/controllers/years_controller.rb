class YearsController < ApplicationController

  def new
    @year = Year.new
  end

  def show
    @year = Year.find(params[:id])
  end
end
