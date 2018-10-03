class UsersController < ApplicationController
  helper_method :all_years

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

  def show
    if logged_in?
      @user = User.find_by(params[:user_id])
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
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
