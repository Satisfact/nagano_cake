class ApplicationController < ActionController::Base

before_action :set_search

def set_search
  #@search = Article.search(params[:q])
  @search = Item.ransack(params[:q]) #ransackメソッド推奨
  @search_items = @search.result.page(params[:page])
end

  protected
  #ifでsign_inをするときちんと飛ばない
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
