class PostsController < ApplicationController

    def index
      @posts = Post.order(created_at: :desc)
      @post = Post.new
      @events = Event.where('date >= ?', DateTime.now).order(:date) 
      @photo = Photo.new    
    end
   
    def create
      @post = Post.new(params.require(:post).permit(:content))
      @post.user = current_user
      @post.save
      redirect_to posts_path
    end
 
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end 
 
    def edit
      @post = Post.find(params[:id])
      @events = Event.where('date >= ?', DateTime.now)
    end

    def update
      @post = Post.find(params[:id])
      if @post.update_attributes(params.require(:post).permit(:content))
        redirect_to posts_path
      else
        render :edit
      end
    end

    private
      def post_params
        params.require(:post).permit(:content)
      end


  end
