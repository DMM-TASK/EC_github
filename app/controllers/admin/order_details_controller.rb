class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      # 製作中になったら注文ステータスを「製作中」に更新
      if @order_detail.making_status == "now_make"
        @order_detail.order.update(status: "making") unless @order_detail.order.status == "making"
      end

      # 全て「製作完了」なら注文ステータスを「発送準備中」に更新
      if @order_detail.order.order_details.all? { |detail| detail.making_status == "complete_make" }
        @order_detail.order.update(status: "preparing") unless @order_detail.order.status == "preparing"
      end
      redirect_to admin_order_path(@order_detail.order), notice: "✅ 注文ステータスを更新しました"
    else
      render 'show'
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
