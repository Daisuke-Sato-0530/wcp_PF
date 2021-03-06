class RankingsController < ApplicationController
  def new
    @ranking = Ranking.new
    #@items = @ranking.items.build
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.user_id = current_user.id

    if @ranking.save
      redirect_to ranking_path(@ranking)
    else
      render new_ranking_path
    end
  end

  def show
    @ranking = Ranking.find(params[:id])
    #Item.left_outer_joins(:favorites)でItemモデルにFavoriteモデルを左外部結合。内部結合だと0いいねのitemが除外されそう？
    #.where(ranking_id: @ranking.id)↑の記述、paramsでid取得したRankingのItemに絞り込む
    #.group("id")で絞り込んだアイテムをidでまとめる(これが無いといいねの数だけItemが増える) groupの中身がidでなければならない理由は不明、item_id favorite_idではだめだった
    #.order("count(favorites.item_id) desc") groupでまとめたitemを並べ替え、大きい順
    @items = Item.left_outer_joins(:favorites).where(ranking_id: @ranking.id).group("id").order("count(favorites.item_id) desc")
  end

  def index
    @rankings = Ranking.all
  end

  private
    def ranking_params
      params.require(:ranking).permit(:title, :introduction, items_attributes: [:id, :image, :name, :body, :_destroy])#rankingにネストしたitemを保存可能にするための記述
    end
end
