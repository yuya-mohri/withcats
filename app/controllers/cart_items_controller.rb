class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.order(created_at: :desc)
  end

  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    if @cart_item.save
      flash[:success] = '商品をカートに追加しました'
      redirect_to  item_url(@cart_item.item_id)
    else
      flash.now[:danger] = '商品をカートに追加できませんでした'
      render 'items/show'
    end  
  end

  def edit
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = '商品情報を削除しました'
    redirect_to cart_items_url
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end  
end
