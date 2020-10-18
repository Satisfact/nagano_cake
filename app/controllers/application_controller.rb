class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource)
    admins_path(resource.id)
  end
end
