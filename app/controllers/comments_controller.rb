require 'pry'
#
class CommentsController < ApplicationController
  # before_action :set_user, only: [:index, :show, :edit, :update, :destroy, :create]

  def index
    destroy_blank_comments()
    set_user_and_comments()

    # normally implicit
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
      format.json {render json: @comments}
    end
    # render :json => @comments
  end

  def show
    @user = User.find(session[:user_id])
    @comment = @user.comments.find(params[:id])


    respond_to do |format|
      format.html {render 'show.html', layout: false}
      format.js {render 'index.js', layout: false}
      format.json{render json: @comment}
    end

  end

  def new
    @user = User.find(session[:user_id])
    @comment = Comment.new(user_id: @user.id)
  end

  def create
    @user = User.find(session[:user_id])
    @comment = @user.comments.build(user_id: @user.id, body: params[:comment][:content])
    if @comment.save

      # render 'houses'
      render 'comments/show', :layout => false


      # respond_to do |format|
      #   format.html {render 'index.html', :layout => false}
      #   format.js {render 'index.js', :layout => false}
      # end

      # render 'create.js', :layout => false
      # redirect_to user_comment_path(@user.id, @comment.id), layout: false
    else
      redirect_to 'root'
    end
  end

  def delete
  end

  def set_user_and_comments
    @user = User.find(session[:user_id])
    @comments = @user.comments
    @comment = Comment.new(user_id: @user.id)
  end

  def destroy_blank_comments
    Comment.all.each {|c|
      c.destroy if c.body == "" || c.body == nil
    }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(session[:user_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
