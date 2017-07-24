class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_user, :display_month_birthday
  
  def display_month_birthday birthday
    if !birthday
      return false
    end
    birthday_arr = birthday.to_s.split('-')
    month = birthday_arr[1] 
    day = birthday_arr[2]
    if Date.current.to_s.split("-")[1] == month
      return month + '/' + day
    end
    return false
  end
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


end
