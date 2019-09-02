class UsersController < ApplicationController
  before_action :set_user ,only: [:show]
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

  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:profile,:image)
  end
end
