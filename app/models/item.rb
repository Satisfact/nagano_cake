class Item < ApplicationRecord
  attachment :image
  #カートの紐付け
  has_many :cart_items
  #注文商品、詳細の紐付け
  has_many :about_orders
	has_many :orders, through: :about_orders
	#ジャンルの紐付け
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 300 }
  validates :price, presence: true
end
