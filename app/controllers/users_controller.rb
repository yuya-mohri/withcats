class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '新規ユーザ登録が完了しました'
      redirect_to root_url
    else
      flash.now[:danger] = '新規ユーザ登録に失敗しました'
      render :new
    end  
    
    
  end

  def edit
  end

  def update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :tel, :postcode, :address, :password, :password_confirmation)
  end  
end
