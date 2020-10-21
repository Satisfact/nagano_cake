class OrdersController < ApplicationController
  #before_action :authenticate!
  #before_action :customer_is_deleted
  #注文情報入力
  def new
    @customer = current_customer
    if @customer.cart_items.blank?
      flash[:alert] = "カートに商品がありません"
      redirect_to cart_item_path(cart_item)
    else
      @order = Oreder.new
      @address = @customer.address
      @send_address = Address.new(customer_id: @customer.id)
    end
  end
  
  def create
  end

  def confirm
    @order = Order.find(params[:id])
    @items = @order.ordered_items
  end
#   def confirm  
# @order = Order.new  
# @cart_items = current_end_user.cart_items  
# @order.payment = params[:order][:payment]  
# if params[:order][:address_option] == "0"  
# @order.postal_code = current_end_user.postal_code  
# @order.order_address = current_end_user.address  
# elsif params[:order][:address_option] == "1"  
# @sta = params[:order][:order_address].to_i  
# binding.pry  
# @order_address = Address.find(@sta)  
# @order.postal_code = @order_address.postal_code  
# @order.order_address = @order_address.address  
# @order.dear_name = @order_address.dear_name  

# elsif params[:order][:address_option] == "2"  
# @order.postal_code = params[:order][:postal_code]  
# @order.order_address = params[:order][:order_address]  
# end  

# end  

  def complete
  end

 #注文履歴
  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id,:postcode,:address,:name,:send_cost,:amount,:item_id)
  end
end
