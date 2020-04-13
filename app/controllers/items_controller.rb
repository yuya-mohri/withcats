class ItemsController < ApplicationController
  def index
    search_word = params[:search]
    if search_word == nil
      @items = Item.order(Arel.sql("RAND()")).all.page(params[:page])
    else
      @items = Item.where(['name LIKE ? or description LIKE ?', "%#{search_word}%", "%#{search_word}%"]).page(params[:page])
    end  
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
      flash.now[:danger] = '新規アイテムの登録に失敗しました'
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
      flash.now[:danger] = '商品情報を変更できませんでした'
      render :edit
    end  
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = '商品情報を削除しました'
    redirect_to root_url
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
