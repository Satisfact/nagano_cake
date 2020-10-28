class AboutOrder < ApplicationRecord
  #注文(order),商品(item)との紐付け
  belongs_to :order
	belongs_to :item

  #注文ステータス
	enum making_status: [:着手不可, :制作待ち, :製作中 ,:制作完了]

	#念のため
	validates :price, presence: true
	validates :amount, presence: true
end
