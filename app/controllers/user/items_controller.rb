class User::ItemsController < ApplicationController
  def index
    @items = Item
  end

  def new
    @new_item = Item.new
  end
  
  def dreate
    @new = Item.new
    current.user_id = current_user.id
    @new.save
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
end
