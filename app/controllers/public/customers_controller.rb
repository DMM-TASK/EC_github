class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "You have updated customer successfully."
    else
      redirect_to edit-customer_path(@customer), alert: "エラーがあります"
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_active: false)
    sign_out current_customer
    redirect_to root_path, notice:"退会が完了しました"
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :is_active, :email)
  end
end
