class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end
  
  def show
  
  end

  def create
    @new_photo = params.require(:photo).permit(:image)
    @photo = Photo.new(@new_photo)
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to :posts
    else
      redirect_to :posts
    end
  end
end