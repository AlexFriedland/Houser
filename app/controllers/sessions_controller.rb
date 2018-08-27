class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new, :create]
    def new
      @user = User.new
    end

    def create
      #raise cookies.inspect
      # @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #   u.name = auth['info']['name']
      #   u.email = auth['info']['email']
      #   u.image = auth['info']['image']
      # end

      #facebook omniauth

      if auth_hash = request.env["omniauth.auth"]
        #they logged in with OAuth
        # raise auth_hash.inspect

        oauth_email = request.env["omniauth.auth"]["info"]["email"]
        if user = User.find_by(:email => oauth_email)
          #if we know that user, log them in

          session[:user_id] = user.id
          redirect_to root_path
        else
          user = User.new(email: oauth_email, password: SecureRandom.hex)
          if user.save
            session[:user_id] = user.id
            redirect_to root_path
          else

          session[:user_id] = user.id

          redirect_to root_path
        end

        #normal login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id

          redirect_to root_path
        else
          render 'sessions/new'
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
