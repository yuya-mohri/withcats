class ItemsController < ApplicationController
  def index
    @items = Item.order("RAND()").all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    
    if @item.save
      flash[:success] = '新規アイテムを登録しました'
      redirect_to @item
    else
      flash[:danger] = '新規アイテムの登録に失敗しました'
      render :new
    end
  end  

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      flash[:success] = '商品情報を変更しました'
      redirect_to @item
    else
      flash[:danger] = '商品情報を変更できませんでした'
      render :edit
    end  
  end

  def destroy
  end
  
  def onsale
    item = Item.find(params[:id])
    item.on_sale! unless item.on_sale?
    flash[:success] = '商品ステータスを「公開」に変更しました'
    redirect_to root_url
  end
  
  def not_onsale
    item = Item.find(params[:id])
    item.not_on_sale! unless item.not_on_sale?
    flash[:success] = '商品ステータスを「非公開」に変更しました'
    redirect_to root_url
  end  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :price, :stock, :description, :image, :status)
  end  
  
end
