class Item < ApplicationRecord
  attachment :image

  #カート
  has_many :cart_items
  #注文商品、詳細
  has_many :orders
  has_many :orders, through: :about_orderes
  #ジャンル
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 300 }
  validates :price, presence: true
end
