class Item < ApplicationRecord
    
     
     belongs_to :genre
     belongs_to :user
     has_many :comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
     def favorited_by?(user)
       favorites.where(user_id: user.id).exists?
     end
     attachment :image
     
     
      validates :title, presence: true
      validates :body, presence: true
      validates :place, presence: true
      validates :genre, presence: true
      validates :shop_name, presence: true
      validates :commodity, presence: true
      validates :price, presence: true
end
