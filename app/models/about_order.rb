class AboutOrder < ApplicationRecord
  #注文(order),商品(item)との紐付け
  belongs_to :order
	belongs_to :item

  #注文ステータス
	enum making_status: {着手不可:0,制作待ち:1,製作中:2,制作完了:3}

	#念のため
	validates :price, presence: true
	validates :amount, presence: true
end
