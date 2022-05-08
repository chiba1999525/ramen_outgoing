class  User::CustomersController < ApplicationController
  
  def index
    @user = current_user
    @customer = @user.customer
  end
  
  def new 
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    @customer.save
    redirect_to user_items_path
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
  def customer_params
    params.require(:customer).permit(:title, :image_id, :body, :user_id, :like)
  end
  
end
