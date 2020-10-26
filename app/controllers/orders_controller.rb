class OrdersController < ApplicationController
  before_action :authenticate_customer!
  #before_action :customer_is_deleted
  #注文情報入力
  def new
    @customer = current_customer
    if @customer.cart_items.blank?
      flash[:alert] = "カートに商品がありません"
      redirect_to cart_item_path(cart_item)
    else
      @order = Order.new
      @address = current_customer.address
      @send_address = Address.new(customer_id: @customer.id)
    end
  end

  def create
    @order = Order.new(order_params)
		@customer = current_customer
		@ads = @customer.addresses
		#支払い条件
    @order.pay = params[:order][:pay]
    #配送先
    if params[:order][:order_status] == "0" #ご自身の住所
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:order_status] == "1" #登録済住所から選択
		  @ad = @ads.find(params[:address][:id])
      @order.address = @ad.address
      @order.postcode = @ad.postcode
      @order.name = @ad.name
    elsif params[:order][:order_status] == "2" #新しいお届け先
      @ad = Address.new
      @ad.customer_id = @customer.id
      @ad.address = params[:address][:address]
      @ad.postcode = params[:address][:postcode]
      @ad.name = params[:address][:name]
      @ad.save #登録
      @order.address = params[:address][:address]
      @order.postcode = params[:address][:postcode]
      @order.name =  params[:address][:name]
    end
    #注文は登録されましたか?
    if @order.save
      redirect_to item_order_path
    end
  end
  #注文確認
  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
  end
  #thak you!
  def complete
  end

 #注文履歴
  def index
    @customer = Customer.find(params[:id])
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postcode,:address,:name,:send_cost,:amount,:item_id)
  end
end
