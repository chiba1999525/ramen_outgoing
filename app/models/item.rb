class Item < ApplicationRecord
    
     belongs_to :customer
     belongs_to :genre
     belongs_to :user
     attachment :image
    
end
