class UsersController < ApplicationController
  before_action :set_user ,only: [:show,:edit,:update]
  def new
    @user = User.new(flash[:user])
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user ,notice: "アカウントを作成しました。"
    else 
      redirect_to root_path, flash: {user: @user, error_messages: @user.errors.full_messages}
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params) || @user.errors.full_messages.size == 2
      redirect_to @user,notice: "ユーザー情報を更新しました。"
    else 
      redirect_to edit_user_path(@user),flash: {user: @user, error_messages: @user.errors.full_messages }
    end
  end
  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:profile,:image)
  end
end
