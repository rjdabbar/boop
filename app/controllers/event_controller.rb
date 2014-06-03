class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @user = current_user
    @users = Event.find(params[:id]).users
    @event = Event.find(params[:id])
    @scorecards = Scorecard.find_by_event_id(@event.id)
  end

  def create
    event_info = params[:event]
    contestant_ids = event_info[:contestant_ids]
    contestant_ids.pop
    @user = current_user
    event_date = Event.make_date_from(event_info.fetch("date(1i)"),event_info.fetch("date(2i)"),event_info.fetch("date(3i)"))
    @event = Event.create_from_form(event_info[:name], event_date, contestant_ids,  @user)

    # Contestant.set_event_from(contestant_ids, @event.id)

    @event.save

    redirect_to controller: :event, action: :index
    
  end

  def destroy
  end

  def new
    @event = Event.new
  end

  def edit
  end
end
