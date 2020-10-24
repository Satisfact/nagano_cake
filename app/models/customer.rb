class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #カートとの紐付け
  has_many :cart_items
  #注文履歴との紐付け
  has_many :orders, dependent: :destroy
  has_many :addresses
end
