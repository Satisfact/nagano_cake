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
	enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

  #念のため
  # validates :last_name, presence: true
  # validates :first_name, presence: true
end
