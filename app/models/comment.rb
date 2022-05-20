class Comment < ApplicationRecord
    
     belongs_to :item
     belongs_to :user
     
      validates :name, presence: true
     
end
