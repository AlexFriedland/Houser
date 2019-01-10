require 'pry'

class CommentsController < ApplicationController

  def index
    # @user = User.find_by_id(session[:user_id])
    @comments = @user.comments
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
    @comment = Comment.new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.build(user_id: session[:user_id], body: params[:comment][:body])

    if @comment.save

      # respond_to do |format|
      #   format.html {redirect_to @post}
      #   format.js {render 'index.js', :layout => false}
      # end

      redirect_to user_comment_path(@user.id, @comment.id), layout: false
    else
      redirect_to 'root'
    end
  end

  def delete
  end

  private
  def comments_params
    params.require(:comment).permit(:body)
  end
end
