class Admin::CommentsController < ApplicationController
    
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to admin_item_path(item.id)  
  end
  
end
