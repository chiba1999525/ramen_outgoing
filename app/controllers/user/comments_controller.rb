class Users::CommentsController < ApplicationController
  
 
  def update
  　@item = Itemm.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @item_new = Item.new
      @comments = @item.comments
      redirect_to user_item_path(@item.id)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
  
  private
  def comment_params
    params.require(:comment).permit(:name, :user_id, :item_id, :count)
  end
end
