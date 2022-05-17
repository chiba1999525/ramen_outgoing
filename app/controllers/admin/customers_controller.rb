class Admin::CustomersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
  end
  
  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:item_id)
    @comment_items = Item.find(comments)
  end
  
end
