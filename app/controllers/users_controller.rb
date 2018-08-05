class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.save

    if @user.save
      redirect_to root_path
    else
      flash[:notice] = "invalid email"
      render '/users/new'
    end

    # if params[:user][:email].present? && !User.exists?(:email => params[:user][:email])
    #   @user.save
    # else
    #   #error logic
    #   flash[:notice] = "your email is invalid"
    # end

    redirect_to root_path
  end

  def something
  end
end
