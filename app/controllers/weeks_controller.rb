class WeeksController < ApplicationController

  def show
    @house = House.find(params[:id])
    @weeks =@house.weeks
  end
  
end
