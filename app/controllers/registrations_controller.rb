class RegistrationsController < ApplicationController

  before_action :session_required, only:[:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(clean_user)
    if @user.save
      redirect_to root_path, notice:'註冊成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(clean_user)
      redirect_to root_path, notice:'修改成功'
    else
      render :edit
    end
  end



  private
  def clean_user
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
  end
end