class ApplicationController < ActionController::Base


 
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when Customer
      customer_path(resource.id) 
    else
      root_path
    end
  end


  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name,:last_name])
  end
end
