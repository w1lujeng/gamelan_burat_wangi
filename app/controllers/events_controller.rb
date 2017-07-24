class EventsController < ApplicationController
  def index
    @event = Event.all
  end
  
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
      if @event.save
      redirect_to users_path
    else
      render :new
    end
  end
 
  def show   
      @event = Event.find(params[:id])
  end

private

  def event_params
    params.require(:event).permit(:title, :date)
  end

end

    