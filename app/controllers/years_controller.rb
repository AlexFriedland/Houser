class YearsController < ApplicationController

  def new
    @year = Year.new
  end

  def create
    @year = Year.new
    #create year by name
    x = params[:year][:year]
    if x.to_i.is_a?(Integer) && x.length == 4
      #add it to houses
      x = params[:year][:house_id]
        x.each do |h_id|
          if h_id != ""
            @year = Year.new(year: params[:year][:year])
            @year.house_id = h_id
            @year.total_income = 0
            @year.save
          end
        end
      redirect_to houses_path
    else
      @year.errors[:year] << "year must be proper format"
      render 'years/new'
    end
  end

  def show
    @year = Year.find(params[:id])
  end

  def update
    @year = Year.find(params[:id])
    @year.update(year_params)
    redirect_to artist_path(@year)
  end
end
