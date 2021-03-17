class CommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id]) #コメントするアイテムの指定
    comment = current_user.comments.new(comment_params) #ログインしているユーザーのid取得
    comment.item_id = item.id #Commentモデルのitem_idカラムにコメントされるアイテムのidを入れる
    comment.save
    @ranking = comment.item.ranking
    @ranking.comments = (@ranking.comments + 1)
    @ranking.save
    redirect_to item_path(item) #非同期通信するときは消す
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    @ranking = @comment.item.ranking
    @ranking.comments = (@ranking.comments - 1)
    @comment.destroy
    redirect_to item_path(params[:item_id]) #非同期通信するときは消す
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :item_id)
  end

end
