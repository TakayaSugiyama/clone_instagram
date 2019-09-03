class PhotosController < ApplicationController
  before_action :set_photo, only: [:show,:edit,:update,:destroy]
  before_action :forbid_login_user
  before_action :only_photo_user, only: [:edit,:update]
  
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def show
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save 
      PhotoMailer.photo_mail(@photo).deliver 
      redirect_to @photo, notice: "投稿しました"
    else 
      redirect_to new_photo_path, flash: {photo: @photo, error_messages: @photo.errors.full_messages}
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy 
    redirect_to photos_path, notice: "投稿を削除しました"
  end

  def confirm 
    @photo = current_user.photos.build(photo_params)
    redirect_to new_photo_path, flash:{error_messages: @photo.errors.full_messages } if @photo.invalid?
  end

  def new 
    if params[:back]
       @photo = current_user.photos.build(photo_params)
    else 
      @photo = Photo.new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "投稿を更新しました"
    else
      redirect_to edit_photo_path(@photo) , flash: {photo: @photo, error_messages: @photo.errors.full_messages}
    end
  end

  def edit 
  end

  private 

  def set_photo 
    @photo = Photo.find(params[:id])
  end

  def photo_params 
    params.require(:photo).permit(:description, :photo,:photo_cache)
  end

  def only_photo_user
    if @photo.user.id != current_user.id
      redirect_to user_path(current_user.id), notice: "権限がありません"
    end
  end
end
