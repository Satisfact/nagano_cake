class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    #今日の注文数を
    @orders = Order.where(created_at: Date.today.all_day)
  end
end
