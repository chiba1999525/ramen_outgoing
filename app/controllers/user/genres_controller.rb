class User::GenresController < ApplicationController
     before_action :authenticate_user!
    def show
        @genre = Genre.find(params[:id])
        @items = @genre.items
        @user = current_user
    end 
    
end
