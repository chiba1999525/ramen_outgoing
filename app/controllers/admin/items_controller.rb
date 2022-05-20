class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    
  end
  
  
  
  def destroy 
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end 
  
end
