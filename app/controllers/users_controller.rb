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
  
 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday)
  end
end
