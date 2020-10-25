class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :authenticate_customer!
  
  protected
  def after_sign_in_path_for(resource)
      case resource
        when Admin
          admins_path
            when Customer
              root_path
      end
  end

  def after_sign_out_path_for(resource)
      case resource
        when Admin
          new_admin_session_path
            when Customer
              root_path
      end
  end

end
