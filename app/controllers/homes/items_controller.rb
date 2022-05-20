class Homes::ItemsController < ApplicationController
    
    def index 
        @items_all = Item.page(params[:page]).per(4).reverse_order
        @user = current_user
        @genres = Genre.all
    end 
end
