class ItemsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @item_comments = @item.comments.page(params[:page]).per(10)
  end

  def index
  end



end
