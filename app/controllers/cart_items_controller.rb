class CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new
    @cart_item.save(cart_item_params)
    redirect_to cart_item_path(@cart_item.id)
  end

  def show
    @cart_item = CartItem.find(params[:id])
    @order = Order.new
  end

  def update
  end

  def destroy
  end
  
  def destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_items).permit(:price, :name, :introduction)
  end
end
