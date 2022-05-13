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
end
