class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items.where(ordered_flag: false).order(id: :desc)
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

  def update
    @cart_item = CartItem.find(params[:id])
    
    if @cart_item.update(cart_item_params)
      flash[:success] = '数量を変更しました'
      redirect_to cart_items_url
    else
      flash.now[:danger] = '数量を変更できませんでした'
      render :index
    end  
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = 'カートから商品を削除しました'
    redirect_to cart_items_url
  end
  
  def confirm
    if @cart_item = CartItem.where(user_id: current_user.id).where(ordered_flag: false)
      @cart_item.update_all(ordered_flag: true)
      flash[:success] = '注文を確定しました'
      redirect_to cart_items_url
    else
      flsh.now[:danger] = 'カートの中身が空です'
      render :index
    end  
  end  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end  
end
