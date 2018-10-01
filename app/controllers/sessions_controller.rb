require 'pry'

class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new, :create], raise: false

    def new
      @user = User.new
    end
    
    def create
      #raise cookies.inspect
      if auth_hash = request.env["omniauth.auth"]
        #they logged in with OAuth
        # raise auth_hash.inspect
        oauth_email = request.env["omniauth.auth"]["info"]["email"]
        if @user = User.find_by(:email => oauth_email)
          #if we know that user, log them in
          session[:user_id] = @user.id
          redirect_to houses_path
        else
          @user = User.new(email: oauth_email, password: SecureRandom.hex)
          if @user.save
            session[:user_id] = @user.id
            redirect_to houses_path
          else
            redirect_to 'login'
          # session[:user_id] = @user.id
          #
          # redirect_to houses_path
          end
        end


      else

        #normal login
        @user = User.find_by(email: params[:email])
          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            binding.pry
            redirect_to houses_path
          else
            flash[:message] = "CANNOT FIND THAT EMAIL"
            render 'sessions/new'
          end
        end

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
