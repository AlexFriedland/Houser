class WeeksController < ApplicationController

  def show
    @week = Week.find(params[:id])
  end

  def new
    @week = Week.new
  end

  def create
    binding.pry

    # add year
    # add house
    # deposit
    # payment
    # renter

    # @week = Week.new(week_params)
    # redirect_to week_path(@week)
  end

end
