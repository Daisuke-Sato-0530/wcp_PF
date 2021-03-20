class UsersController < ApplicationController
before_action
  def show
    @user = current_user
    #@rankings = Item.joins(:favorites).group(:ranking_id)
    @your_favorites = current_user.favorites.group(:ranking_id).order(id: "DESC")
  end

  def edit
    @user = current_user
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
