class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admins_orders_path, notice: "注文ステータス更新しました"
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :name, :send_cost, :bill, :pay, :ordered_status)
  end
end
