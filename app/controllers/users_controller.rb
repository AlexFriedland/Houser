class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]


    if @user.save
      session[:user_id] = @user.id
      redirect_to '/houses'
    else

      render '/users/new'
    end

    # if params[:user][:email].present? && !User.exists?(:email => params[:user][:email])
    #   @user.save
    # else
    #   #error logic
    #   flash[:notice] = "your email is invalid"
    # end


  end

  def something
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    # def complete_user?
    #   params["name"] != ""
    #   params["password"] != ""
    # end
  end
end
