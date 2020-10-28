class Admins::AboutOrdersController < ApplicationController
  #制作ステータスの更新
  def update
    @about_order = AboutOrder.find(params[:id])
    @order = @about_order.order
     if @about_order.update(about_order_params)
       redirect_to request.referer, notice: "制作ステータス更新しました"
     end
  end
  private
  def about_order_params
    params.require(:about_order).permit(:making_status)
  end
end
