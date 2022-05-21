class  User::CustomersController < ApplicationController
   before_action :authenticate_user!
  def index
    @my_user = current_user
    @users = User.all
  end
  
  def mypage
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to mypage_user_customer_path(current_user.id)
    end 
  end
  
  
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to edit_user_customer_path(current_user.id)
    end 
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to mypage_user_customers_path(@user.id)
       flash[:notice] = '更新しました！'
    else
       render :edit
    end 
       
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
  
  def confirm 
    @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_items_path(current_user.id)
     end 
  end 
  
  def withdraw_processing
    user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    user.update(is_delete: :true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  
  private
  def user_params
    params.require(:user).permit(:title, :image, :body, :like, :name, :email, :item_id, :is_delete)
  end
  
end
