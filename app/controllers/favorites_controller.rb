class FavoritesController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: item.id)
    favorite.save
    redirect_to ranking_path(item.ranking)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: item.id)
    favorite.destroy
    redirect_to ranking_path(item.ranking)
  end

end
