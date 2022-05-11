class User::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @user = current_user
    @genres = Genre.all
  end

  def new
    @item = Item.new
   
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    if  flash[:notice] = '新規投稿しました！'
        redirect_to user_items_path
    else
        render :new
    end
  end 

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
    　 redirect_to user_items_path
    end 
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
   
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = '投稿変更しました！'
       redirect_to user_item_path(@item.id)
    else
       render :edit
    end
  end
    

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(:title, :image, :body, :place, :genre_id, :shop_name, :commodity, :price, :user_id, :customer_id)
  end

end
