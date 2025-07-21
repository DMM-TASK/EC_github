class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer_id
    @cart_items = current_customer.cart_items
    case params[:order][:select_address]
    when "own"
      @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
  when "registered"
    address = Address.find(params[:order][:address_id])
    @order.postal_code = address.postal_code
    @order.address = address.address
    @order.name = address.name
  when "new"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
  end

  def thanks
  end

  def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.shipping_cost = 800
  @order.status = 0

  cart_total = current_customer.cart_items.sum { |ci| ci.item.price * ci.amount }
  @order.total_payment = cart_total + @order.shipping_cost
  @order.status = 0

if @order.save
  current_customer.cart_items.each do |cart_item|
    OrderDetail.create(
      order_id: @order.id,
      item_id: cart_item.item_id,
      amount: cart_item.amount,
      price: cart_item.item.price,
      making_status: 0
    )
  end

  current_customer.cart_items.destroy_all
  redirect_to thanks_public_orders_path
else
  render :new
end
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end
end
