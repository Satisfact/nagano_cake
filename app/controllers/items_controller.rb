class ItemsController < ApplicationController
#管理者用別途作成
 def top
  #アクティブtrueのジャンルを表示
  @genres = Genre.where(is_active: true)
  #ダメならGenre.all(genre_id: params["genre"])
  @sweet_items = Item.limit(8).offset(4)
 end

 def index
  @quantity = Item.where(is_active: true).count
  #kaminariつける（不要？）
  @sweet_items = Item.where(is_active: true).page(params[:page]).per(8)
  @genres = Genre.where(is_active: true)
 end

 def show
  @sweet_item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.where(is_active: true)
 end

 def search
  @sweet_items = Item.where(genre_id: params[:format]).page(params[:page]).per(8)
  @quantity = Item.where(genre_id: params[:format]).count
  @genres = Genre.where(is_active: true)
  #ビューを作らない
  #render 'index'
 end

end
