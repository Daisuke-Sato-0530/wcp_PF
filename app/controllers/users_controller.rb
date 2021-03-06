class UsersController < ApplicationController



  def show
    @user = current_user
    #@rankings = Item.joins(:favorites).group(:ranking_id)
    @your_favorites = current_user.favorites.group(:ranking_id).order(id: "DESC")
  end

  def edit
    @user = current_user
    redirect_back(fallback_location: root_path)if @user.guest?
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
    def user_params
      params.require(:user).permit(:name,:email)
    end

end
