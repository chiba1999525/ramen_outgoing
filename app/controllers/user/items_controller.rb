class User::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.customer_id = current_user.id
    @item.user_id = current_user.id
    @item.save
    redirect_to user_items_path
  end 

  def edit
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(:title, :image, :body, :place, :genre_id, :shop_name, :commodity, :price, :user_id, :customer_id)
  end

end
