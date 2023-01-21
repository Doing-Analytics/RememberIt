class UserRegistrationsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to dashboard_path, notice: '成功註冊！'
    else
      flash.now[:alert] = '註冊失敗'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone, :name, :password, :password_confirmation, :avater)
  end
end
