class PostsController < ApplicationController

    def index
      @posts = Post.order(created_at: :desc)
      @post = Post.new
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
      @post.update
      redirect_to posts_path
    end

  end
