class CommentsController < ApplicationController
  def show
    @house = House.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
  end

  def delete
  end
end
