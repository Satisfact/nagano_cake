class Item < ApplicationRecord
  attachment :image

  has_many :cart_items
  #注文商品、詳細
  #has_many :
  #has_many :
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 300 }
  validates :price, presence: true
end
