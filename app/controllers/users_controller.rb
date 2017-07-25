class UsersController < ApplicationController

  helper_method :display_month_birthday

  def index
    @users = User.all
    @events = Event.where('date > ?', DateTime.now)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
  end 
  
  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params.require(:user).permit(:name, :email, :password_digest, :birthday))
        redirect_to users_path
      else
        render :edit
      end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday)
  end
  
end
