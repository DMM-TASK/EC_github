class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)

    if resource.is_a?(Admin)
      admin_root_path
    else
      customer_path(current_customer.id)
    end
    case resource
    when Admin
      admin_root_path
    when Customer
      customer_path(current_customer.id) 

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
end

