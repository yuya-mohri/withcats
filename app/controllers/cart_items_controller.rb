class CartItemsController < ApplicationController
  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end  
end
