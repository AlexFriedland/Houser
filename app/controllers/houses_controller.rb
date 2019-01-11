require 'pry'

=begin
<!-- FIX THIS LINK
<div><%= link_to 'Add New Year', new_house_year_path %></div>
-->
=end

class HousesController < ApplicationController
  before_action :authentication_required

  def new
    @house = House.new

    # remove layout can help w js
    # render 'comments/index', :layout => false

    # render json
    # render :json => @house

    # this is implicit in rails, rails responds to the language response requested by page. hence returning the proper type of code
    # respond_to do |format|
    #   format.html {render 'index.html', :layout => false}
    #   format.js {render 'index.js'}
    # end
  end

  def index
    @user = User.find(session[:user_id])
    #comments stuff
    @comments = @user.comments
    @comment = @user.comments.build(user_id: @user.id)
    #if not logged in can't see this, go back to login
    #if session[:user_id].present?

  end

  def show
    @house = House.find(params[:id])
    # binding.pry
  end

  def create
    @house = House.new(house_params)
    #if house saves,
    if @house.save
      @user = User.find(session[:user_id])

      #logic to find + create new years
      x = params[:house][:year_ids]
      x[0] = "0"
      x.each do |id|
        y = Year.find_by_id(id)
        if y != nil
          @house.years << Year.create!(house_id: @house.id, year: y.year, total_income: 0)
        end
      end

      @user.houses << @house
      # binding.pry
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
