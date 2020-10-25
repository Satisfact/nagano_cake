class ItemsController < ApplicationController
#管理者用別途作成
 def top
  #アクティブtrueのジャンルを表示
  @genres = Genre.where(is_active: true)
  #ダメならGenre.all(genre_id: params["genre"])
  @sweet_items = Item.limit(4).offset(4)
 end

 def index
  #kaminariつける（不要？）
  #ジャンル検索
  if params[:genre_id].present?
   @sweet_item = Item.where(genre_id: params[:genre_id])
   @sweet_items = @sweet_item.where(is_active: true).page(params[:page]).per(8)
   @quantity = Item.where(genre_id: params[:genre_id]).count
   @genre = Genre.find(params[:genre_id])
   @genres = Genre.where(is_active: true)
  else
   @sweet_items = Item.where(is_active: true).page(params[:page]).per(8)
   @genres = Genre.where(is_active: true)
   @quantity = Item.where(is_active: true).count
  end
 end

 def show
  @sweet_item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.where(is_active: true)
 end

end
