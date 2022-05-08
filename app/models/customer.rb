class Customer < ApplicationRecord
    
      belongs_to :user
      has_many :items, dependent: :destroy 
      attachment :image 
    
end
