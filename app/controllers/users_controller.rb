class UsersController < ApplicationController

  helper_method :format_date
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

  def format_date birthday
    if !birthday
      return ''
    end
    birthday_arr = birthday.to_s.split('-')
    puts birthday_arr

    month = birthday_arr[1] 
    day = birthday_arr[2]
    return month + '/' + day
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday)
  end
end
