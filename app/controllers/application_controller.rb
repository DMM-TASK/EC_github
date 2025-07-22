class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      customer_path(current_customer.id)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

end
