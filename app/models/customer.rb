class Customer < ApplicationRecord
    
      belongs_to :user
      attachment :image 
    
end
