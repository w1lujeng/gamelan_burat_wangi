class HomeController < ApplicationController

  def index
    @events = Event.where(public: true)
  end

end