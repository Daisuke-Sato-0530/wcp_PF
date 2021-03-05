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
  end

  def index
  end

  private
    def ranking_params
      params.require(:ranking).permit(:title, :introduction, items_attributes: [:id, :image, :name, :body, :_destroy])#rankingにネストしたitemを保存可能にするための記述
    end
end
