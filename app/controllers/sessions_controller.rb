class SessionsController < ApplicationController

    def new

    end

    def create
      #raise cookies.inspect
      user = User.find_by(email: params[:email])

      session[:user_id] = user.id 
      #login

    end
end
