class User::CommentsController < ApplicationController
  
 
  def create
    item = Item.find(params[:item_id])
    comment = current_user.comments.new(comment_params)
    comment.item_id = item.id
    comment.save
    redirect_to user_item_path(item.id)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to user_item_path(item.id)  
  end
  
  private
  def comment_params
    params.require(:comment).permit(:name, :user_id, :item_id, :count)
  end
end
