class HousesController < ApplicationController

  def new
    @house = House.new
  end

  def index
    @houses = House.all
  end

  def weeks_index
    @house = House.find(params[:id])
    @weeks = @house.weeks
  end

  def show
    @house = House.find(params[:id])
  end

  def create
    @house = House.new(house_params)
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
