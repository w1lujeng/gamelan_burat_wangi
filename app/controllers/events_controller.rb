class EventsController < ApplicationController

helper_method :is_public
 
  def index
  end
  
  def new
    @event = Event.new
    @events = Event.where('date >= ?', DateTime.now).order(:date)
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

  def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to users_path
  end 

  def edit
      @event = Event.find(params[:id])
      @events = Event.where('date >= ?', DateTime.now)
  end

  def update
      @events = Event.where('date >= ?', DateTime.now)
      @event = Event.find(params[:id])
        if @event.update_attributes(params.require(:event).permit(:title, :date))
          redirect_to users_path
        else
          render :edit
        end
  end
  
  def is_public
    @event = Event.where('date >= ?', 'public == True')
  end

  
private

  def event_params
    params.require(:event).permit(:title, :date, :public)
  end

end

    