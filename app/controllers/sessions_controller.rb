class SessionsController < ApplicationController

    def new

    end

    def create
      #raise cookies.inspect

      #facebook omniauth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end

      session[:user_id] = @user.id

      render 'welcome/home'

      #regular auth
      # if @user = User.find_by(email: params[:email]) && @user.authenticate(params[:password])
      #   session[:user_id] = @user.id
      #   redirect_to root_path
      # else
      #   render 'sessions/new'
      # end
      #login

    end

    def destroy
      reset_session
      redirect_to '/login'
    end



    private

    def auth
      request.env['omniauth.auth']
    end
end
