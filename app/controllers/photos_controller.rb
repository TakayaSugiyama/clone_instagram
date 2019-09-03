class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  def index
  end

  def show
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save 
      redirect_to @photo, notice: "投稿しました"
    else 
      redirect_to new_photo_path, flash: {photo: @photo, error_messages: @photo.errors.full_messages}
    end
  end

  def destroy
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
  end

  private 

  def set_photo 
    @photo = Photo.find(params[:id])
  end

  def photo_params 
    params.require(:photo).permit(:description, :photo,:photo_cache)
  end
end
