class FavoritesController < ApplicationController
  before_action :forbid_login_user
  def create
    @photo = Photo.find(params[:photo_id])
    if current_user 
      @favorite = Favorite.new(user: current_user, photo: @photo)
      @favorite.save 
      redirect_to @photo
    else 
      redirect_to @photo, notice: "ログインしてください"
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @favorite = Favorite.find_by(user: current_user, photo: @photo)
    @favorite.destroy 
    redirect_to @photo
  end

  def index 
    user = User.find(params[:user_id])
    @photos = user.favorites_photos
  end
end
