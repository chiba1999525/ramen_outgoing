class Item < ApplicationRecord
    
     belongs_to :customer
     belongs_to :genre
     attachment :image 
    
end
