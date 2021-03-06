class RankingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @ranking = Ranking.new
    @items = @ranking.items.build#ランキングのNewにItemの入力フォームをあらかじめ一つ追加
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

  #def index
    #if params[:tag_name]
      #@rankings = Ranking.tagged_with("#{params[:tag_name]}")
    #else
      #@rankings = Ranking.all
    #end
  #end

  def index
    @search = Ranking.ransack(params[:q])#検索するモデル
    @rankings = if params[:tag_name].present?#タグを押してタグのパラメーターが送られてきたら
                  Ranking.tagged_with("#{params[:tag_name]}")
                else
                  @search.result
                end
    @rankings = @rankings.page(params[:page]).per(10)

    @year = []
    (-12..0).each do |m|
      @m = []
      @d = m.month.from_now.beginning_of_month.to_date
      @m = (@d..@d.end_of_month.to_date)
      #(@d..@d.end_of_month.to_date).each do |mm|
        #@m.push(mm)
      #end
      @year.push(@m)
    end
  end

  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy
    redirect_to rankings_path
  end



  private
    def ranking_params
      params.require(:ranking).permit(:title,:item_id,:format, :tag_list,:introduction, items_attributes: [:id, :image, :name, :body, :_destroy])#rankingにネストしたitemを保存可能にするための記述
    end
end
