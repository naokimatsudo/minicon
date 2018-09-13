class Admin::EventsController < ApplicationController
  layout 'admin'
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new 
  end
  
  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to admin_event_path(@event)
      flash.notice = 'Event was successfully created.'
    else
      flash.now['alert'] = 'Event could not be created'
      render :new
    end
  end 

  def edit
  end
  
  def update
    if @event.update(events_params)
      redirect_to admin_event_path(@event), notice: 'Event was successfully updated'
    else
      flash.now[:alert] = 'Event could not be updated'
      render :edit
  end
  end 

  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end
  
  private
  
  def set_event
    @event = Event.find(params[:id])
  end
  
  def events_params
      params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  end
  
end
