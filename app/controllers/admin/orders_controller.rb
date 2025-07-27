class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.reorder(created_at: :desc).page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == "paid"
        @order.order_details.update_all(making_status: "wait_make")
      end
      redirect_to admin_order_path(@order), notice: "✅ 注文ステータスを更新しました"
    else
      render 'show'
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
