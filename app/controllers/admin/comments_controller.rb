class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def create
    item = Item.find(params[:item_id])
    comment = current_user.comments.new(comment_params)
    comment.item_id = item.id
    if  comment.save
       redirect_to user_item_path(item.id)
       flash[:notice] = 'コメントしました！'
    else
        @item = Item.find(params[:id])
        @user = @item.user
        @comment = Comment.new
        render template: "user/items/show"
    end 
  end    
    
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to admin_item_path(params[:item_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:name, :user_id, :item_id, :count)
  end
  
end
