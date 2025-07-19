class Public::AddressesController < ApplicationController
  def index
    @address　= Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.current_customer_id = current_customer.id
    if @address.save
      redirect_to Public_addresses_path, notice: "配送先を登録しました。"
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if@address.update(address_params)
      redirect_to Public_addresses_path, notice: "配送先を更新しました。"
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to Public_addresses_path, notice: "配送先を削除しました。"
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
end
