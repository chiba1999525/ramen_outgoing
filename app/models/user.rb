class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
           attachment :image
           has_many :items, dependent: :destroy
           has_many :comments, dependent: :destroy
           has_many :favorites, dependent: :destroy
           has_many :entries, dependent: :destroy
           has_many :messages, dependent: :destroy
           
         validates :title, presence: true
         validates :body, presence: true
         validates :image, presence: true
         validates :name, presence: true
         validates :like, presence: true
           
            # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_delete == false)
  end
end
