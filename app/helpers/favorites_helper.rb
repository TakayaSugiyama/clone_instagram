module FavoritesHelper 
  def  liked?(photo)
    @favorite = Favorite.find_by(user: current_user.id, photo: photo.id)
    if @favorite 
      true 
    else 
      false 
    end
  end

  def likes_count(photo)
    @favorites = Favorite.where(photo: photo.id)
    @favorites.size
  end


end