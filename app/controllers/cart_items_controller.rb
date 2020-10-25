class CartItemsController < ApplicationController
  before_action :find_cart_item, only:[:update, :destroy]
  
  def create
    #old item に current_customerのcart_itemsの中からitem_idがparams(item/showで作成したcart_item)のitem_idと同じものを探して入力
    @old_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #old_itemが見つかった場合
    if @old_item.present?
      #@old_itemのamountとparams(item/showで作成したcart_item)のamountを足し算[to_iで文字列型(string型)を整数(integer型)に変換]
      @old_item.amount = @old_item.amount + params[:cart_item][:amount].to_i
      @old_item.save
    #old_itemが見つからなかった場合
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def destroy
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to items_path
  end
  
  def update
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)

  end
  
  
  private 
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
  def find_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

end

