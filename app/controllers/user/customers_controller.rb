class  User::CustomersController < ApplicationController
  
  def index
    @user = current_user
  end
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_items_path
  end 
  
  def mypage
    @user = current_user
  end 
  
  
  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_user_customers_path
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :image, :body, :like, :name, :email)
  end
  
end
