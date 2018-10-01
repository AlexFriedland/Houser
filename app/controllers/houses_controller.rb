require 'pry'

class HousesController < ApplicationController
  before_action :authentication_required

  def new
    @house = House.new
  end

  def index
    #if not logged in can't see this, go back to login
    #if session[:user_id].present?

    @user = User.find(session[:user_id])

  end

  def show
    @house = House.find(params[:id])
  end

  def create
    @house = House.new(house_params)
    binding.pry
    #if house saves, 
    if @house.save
      @user = User.find(session[:user_id])
      @years =
      @user.houses << @house
      redirect_to houses_path
    else
      render 'house/new'
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house.update(house_params)

    if @house.save
      redirect_to @house
    else
      render :edit
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    flash[:notice] = "House deleted."
    redirect_to houses_path
  end



  private

  def house_params
    params.require(:house).permit(:name, :market_value, :info, :purchase_price, :total_expenses, :total_income, :value)
  end


end
