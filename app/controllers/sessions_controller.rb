class SessionsController < ApplicationController

    def new

    end

    def create
      #raise cookies.inspect

      if @user = User.find_by(email: params[:email]) && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'sessions/new'
      end
      #login

    end

    def destroy
      reset_session
      redirect_to '/login'
    end
end
