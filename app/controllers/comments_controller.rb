require 'pry'

class CommentsController < ApplicationController
  # before_action :set_user, only: [:index, :show, :edit, :update, :destroy, :create]

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end

  def show
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])

    # respond_to do |format|
    #   format.html {render 'index.html', layout: false}
    #   format.js {render 'index.js', layout: false}
    # end

  end

  def new
    @user = User.find_by_id(session[:user_id])
    @comment = Comment.new(user_id: @user.id)
  end

  def create

    @user = User.find(session[:user_id])
    binding.pry
    @comment = @user.comments.build(user_id: @user.id, body: params[:comment][:body])

    if @comment.save

      render 'comments/show'
      # respond_to do |format|
      #   format.html {render 'index.html', :layout => false}
      #   format.js {render 'index.js', :layout => false}
      # end
      #
      # render 'create.js', :layout => false
      # redirect_to user_comment_path(@user.id, @comment.id), layout: false
    else
      redirect_to 'root'
    end
  end

  def delete
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_id(session[:user_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
