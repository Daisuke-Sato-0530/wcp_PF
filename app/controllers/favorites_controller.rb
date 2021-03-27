class FavoritesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.new(user_id: current_user.id)
    @ranking = favorite.item.ranking
    @ranking.favorites = (@ranking.favorites + 1)#いいねを押すたびにRankingモデルのレコードにいいね数+1
    @ranking.save
    favorite.ranking_id = favorite.item.ranking_id
    favorite.save
    #redirect_to ranking_path(@item.ranking) #非同期通信の為コメントアウト
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.find_by(user_id: current_user.id)
    @ranking = favorite.item.ranking
    @ranking.favorites = (@ranking.favorites - 1)#いいねを押すたびにRankingモデルのレコードにいいね数-1
    @ranking.save
    favorite.destroy
    #redirect_to ranking_path(@item.ranking) #非同期通信の為コメントアウト
  end

end
