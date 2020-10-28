class Order < ApplicationRecord
  #customerとの紐付け
  belongs_to :customer
  #about_orderとの紐付け
  has_many :about_orders, dependent: :destroy
  #itemテーブルとの紐付け
	has_many :items, through: :ordered_items
	accepts_nested_attributes_for :about_orders

	#支払い方法
	enum pay: {クレジットカード:0, 銀行振込:1}
  #注文ステータス
	enum order_status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4}

  #念のため
  # validates :last_name, presence: true
  # validates :first_name, presence: true
end
