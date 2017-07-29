class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end
  
  def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photos_path
  end 


  def create
    @new_photo = params.require(:photo).permit(:image, :content)
    @photo = Photo.new(@new_photo)
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to :photos
    else
      redirect_to :posts
    end
  end
  
end