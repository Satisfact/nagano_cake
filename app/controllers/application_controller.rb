class ApplicationController < ActionController::Base

before_action :set_search

def set_search
  @q = Item.ransack(params[:q]) #ransackメソッド推奨
  @search_items = @q.result.where(is_active: true).page(params[:page]).per(8)
end

  protected
  #ifでsign_inをするときちんと飛ばない(sign_inとsign_outが同じ記述のため失敗？)
  # def after_sign_in_path_for(resource)
  #   if resource == :admin
  #     admins_path
  #   else
  #     root_path
  #   end
  # end
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admins_path
      when Customer
        root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

end
