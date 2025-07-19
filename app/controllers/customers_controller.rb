class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customers_my_page_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :is_active,:email)
  end
end
