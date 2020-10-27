class OrdersController < ApplicationController
  before_action :authenticate_customer!
  #before_action :customer_is_deleted
  #注文情報入力
  def new
    @customer = current_customer
    if @customer.cart_items.blank?
      flash[:notice] = "カートに商品がありません"
      redirect_to cart_items_path
    else
      @order = Order.new
      @address = current_customer.address
      @send_address = Address.new(customer_id: @customer.id)
    end
  end

  #注文確認
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    #配送先
    if params[:order][:send_address].to_i == 0 #ご自身の住所
      @order.postcode = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:send_address].to_i == 1 #登録済住所から選択
      @order.postcode =  Address.find(params[:order][:sending_address].to_i).postcode
      @order.address = Address.find(params[:order][:sending_address].to_i).address
      @order.name = Address.find(params[:order][:sending_address].to_i).name
    elsif params[:order][:send_address].to_i == 2 #新しいお届け先
      @address = Address.new()
      @address.address = params[:order][:address]
      @address.customer_id = current_customer.id
      @address.postcode = params[:order][:postcode]
      @address.name = params[:order][:name]
      if @address.save #登録
        @order.address = params[:order][:address]
        @order.postcode = params[:order][:postcode]
        @order.name =  params[:order][:name]
      else
        render "new"
      end
    end
  end
  #thak you!
  def complete
  end

  def create
    @orders = Order.new(order_params)
		@orders.customer_id = current_customer.id
		@orders.save
		#注文商品about_order(履歴などに使用)
		current_customer.cart_items.each do |cart_item|
		  @about_oder = Oder.new
		  #注文明細id
		  @about_oder.item_id = cart_item.item.id
		  #個数
		  @about_oder.number_of_items = cart_item.number_of_items
		  #税込
		  @about_oder.items_tax_included_price = (cart_item.price * 1.1).floor
		  @about_oder.order_id = @order.id
		  @about_oder.save
		end
		#カートを空っぽに
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end


 #注文履歴
  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    #他顧客のアクセス阻止(念のため)
    unless current_customer.nil? || current_customer.id == @order.user_id
      flash[:notice] = "アクセスできません"
      redirect_to orders_path(id: current_customer.id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :name, :send_cost, :amount, :item_id, :pay ,:order_status)
  end
  def address_params
    params.permit(:address, :postcode, :name)
  end
end
