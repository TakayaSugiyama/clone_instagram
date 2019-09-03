class SessionsController < ApplicationController
  def new;end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id 
      redirect_to @user, notice: "ログインしました"
    else 
      redirect_to login_path, notice: "ログインに失敗しました"
    end
  end

  def destroy 
    @user = User.find(session[:user_id])
    session.delete(:user_id)
    redirect_to root_url, notice: "ログアウトしました"
  end
end
