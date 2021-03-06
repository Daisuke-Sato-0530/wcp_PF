class FavoritesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_to ranking_path(@item.ranking) #非同期通信
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #redirect_to ranking_path(@item.ranking) #非同期通信
  end

end
