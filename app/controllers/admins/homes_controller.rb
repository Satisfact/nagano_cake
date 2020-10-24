class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    #@quantity = Order.where(is_active: true).count
  end
end
