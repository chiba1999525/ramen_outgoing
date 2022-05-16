class  User::CustomersController < ApplicationController
  
  def index
    @my_user = current_user
    @users = User.all
  end
  
  def mypage
    @user = current_user
  end
  
  def room
    @user = User.find(params[:id])
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
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
  
  
  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:item_id)
    @comment_items = Item.find(comments)
  end
  
  def withdraw_processing
    user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    user.update(is_delete: :false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  
  private
  def user_params
    params.require(:user).permit(:title, :image, :body, :like, :name, :email, :item_id, :is_delete)
  end
  
end
