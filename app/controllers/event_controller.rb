class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def create
    event_info = params[:event]

    event_date = Event.make_date_from(event_info.fetch("date(1i)"),event_info.fetch("date(2i)"),event_info.fetch("date(3i)"))
    @event = Event.create_from_form(event_info[:name], event_date)
    @event.save
    
  end

  def destroy
  end

  def new
    @event = Event.new
  end

  def edit
  end
end
