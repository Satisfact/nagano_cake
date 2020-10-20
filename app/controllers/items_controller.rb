class ItemsController < ApplicationController
#管理者用別途作成
 def top
  @genres = Genre.all
  #kaminariつける
  @sweet_items = Item.all
 end
 
 def index
  @quantity = Item.count
  #kaminariつける
  @sweet_items = Item.all
  @genres = Genre.all
 end
 
 def show
  @sweet_item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all 
 end

end
