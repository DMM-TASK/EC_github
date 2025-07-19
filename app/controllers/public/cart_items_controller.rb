class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.includes(:item)
    @items = Item.all
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path, notice: "カート内商品の数量を更新しました。"
    else
      @cart_items = current_customer.cart_items.includes(:items)
      flash.now[:alert] = "数量の更新に失敗しました。"
      render :index
    end
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
  cart_item.destroy
  redirect_to public_cart_items_path, notice: "商品をカートから削除しました。"
  end

  def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to public_cart_items_path, notice: "カート内の全商品を削除しました。"
  end

  def create
    existing_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    if existing_item
      existing_item.amount += cart_item_params[:amount].to_i
      existing_item.save
    else
      new_cart_item = current_customer.cart_items.new(cart_item_params)
      new_cart_item.save
    end
    redirect_to public_cart_items_path,notice: "商品をカートに追加しました。"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
