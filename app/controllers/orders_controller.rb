class OrdersController < ApplicationController
  #before_action :authenticate!
  #before_action :customer_is_deleted
  #注文情報入力
  def new
    @customer = current_customer
    # if @customer.cart_items.blank?
    #   flash[:alert] = "カートに商品がありません"
    #   redirect_to cart_item_path(cart_item)
    # else
    #   @order = Oreder.new
    #   @address = @customer.address
    #   @send_address = Address.new(customer_id: @customer.id)
    # end
  end
  
  def create
  end

  def confirm
  end

  def complete
  end

 #注文履歴
  def index
  end

  def show
  end
end
