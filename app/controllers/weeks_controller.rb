class WeeksController < ApplicationController

  def show
    @week = Week.find(params[:id])
  end

  def new
    @week = Week.new
  end

  def create
  end

end
