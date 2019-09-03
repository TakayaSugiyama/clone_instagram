class ApplicationController < ActionController::Base
  include SessionsHelper
  include FavoritesHelper

  private 

  def forbid_login_user
    if !session[:user_id]
      redirect_to login_path, notice: "ログインしてください"
    end
  end


end
