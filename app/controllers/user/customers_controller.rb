class  User::CustomersController < ApplicationController
  
  def index
    @my_user = current_user
    @users = User.all
  end
  
  def mypage
    @user = current_user
  end 
  
  
  def show
    @user = User.find(params[:id])
    @items = @user.items
  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_user_customers_path
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :image, :body, :like, :name, :email)
  end
  
end
