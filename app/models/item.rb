class Item < ApplicationRecord
    
     
     belongs_to :genre
     belongs_to :user
     attachment :image
    
end
