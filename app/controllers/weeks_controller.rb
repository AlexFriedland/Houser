class WeeksController < ApplicationController

  def show
    @week = Week.find(params[:id])
  end

end
