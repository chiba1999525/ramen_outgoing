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
  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @item = Item.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("title LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end
     
     
    
end
