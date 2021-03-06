class CommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id]) #コメントするアイテムの指定
    comment = current_user.comments.new(comment_params) #ログインしているユーザーのid取得
    comment.item_id = item.id #Commentモデルのitem_idカラムにコメントされるアイテムのidを入れる
    comment.save
    redirect_to item_path(item) #非同期通信のためredirect_toは消す
  end

  def destroy
    Comment.find_by(id: params[:id], item_id: params[:item_id]).destroy
    redirect_to item_path(params[:item_id]) #非同期通信のため
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :item_id)
  end

end
