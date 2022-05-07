class  User::CustomersController < ApplicationController
  
  def index
  end
  
  def mypage 
    @user = current_user
    #@customer = current_user.customer
  end 

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
