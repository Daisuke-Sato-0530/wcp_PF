class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def index
  end
  
  
  
end
