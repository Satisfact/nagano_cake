class ItemsController < ApplicationController
#管理者用別途作成
 def top
  #アクティブtrueのジャンルを表示
  @genres = Genre.where(is_active: true)
  #limit(個数).offset(どこから)
  @sweet_items = Item.limit(4).offset(0)
 end

 def index
  #kaminariつける（不要？）
  #ジャンル検索
  if params[:genre_id].present?
   @sweet_item = Item.where(genre_id: params[:genre_id])
   @sweet_items = @sweet_item.where(is_active: true).page(params[:page]).per(8)
   #@genre = Genre.find(params[:genre_id])
   @genres = Genre.where(is_active: true)
   @title = Genre.find(params[:genre_id]).name
  else
   @sweet_items = Item.where(is_active: true).page(params[:page]).per(8)
   @genres = Genre.where(is_active: true)
   @title = "商品"
  end
 end

 def show
  @sweet_item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.where(is_active: true)
 end

end
