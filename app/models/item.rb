class Item < ApplicationRecord
    
     
     belongs_to :genre
     belongs_to :user
     has_many :comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
     def favorited_by?(user)
       favorites.where(user_id: user.id).exists?
     end
     attachment :image
     
     
     # 検索方法分岐
     
    
end
