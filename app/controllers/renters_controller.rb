class RentersController < ApplicationController

  def show
    @renter = Renter.find(params[:id])
  end


end
