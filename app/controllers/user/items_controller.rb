class User::ItemsController < ApplicationController
  
   before_action :authenticate_user!
  
  def index
    @items_all = Item.all
    @user = current_user
    @genres = Genre.all
  end
  

  def new
    @item = Item.new
    @comment = Comment.new
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


  def search
    @genre = Genre.find(params[:id])
    @items = @genre.items
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_posts = Item.find(favorites)
  end
  
  def comments
    comments = Comment.where(user_id: @user.id).pluck(:item_id)
    @comment_posts = Item.find(comments)
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
    @comment = Comment.new
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
