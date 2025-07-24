class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only:[:new, :edit, :create, :update, :destroy]
  
  def index
    @items= Item.where(is_active: true).page(params[:page]).per(10)
  end

  def show
    @genres = Genre.all
    @item = Item.find_by(id:params[:id], is_active: true)
    redirect_to items_path, alert: "商品が見つかりません" unless @item
  end

end
