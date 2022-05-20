class Homes::GenresController < ApplicationController
    
     
    def show
        @genre = Genre.find(params[:id])
        @items = @genre.items
        @user = current_user
    end 
    
end
