class Admins::AboutOrdersController < ApplicationController
  #制作ステータスの
  def update
    @about_order = AboutOrder.find(params[:id])
     if @about_order.update(about_order_params)
       redirect_to request.referer
     end
  end
  
  private
  def about_order_params
    params.require(:about_order).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
