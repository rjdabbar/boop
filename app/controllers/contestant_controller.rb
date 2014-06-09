class ContestantController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  def index
    @contestants = Contestant.all
    @events = Event.all
  end

  def edit
    @contestant = Contestant.find(params[:id])
    @contestant.add_event_to(@contestant, params[:contestant][:event_ids])
    @contestant.save!

    redirect_to controller: :contestant, action: :index
  end

  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.create_from_params(params[:contestant][:name])
    redirect_to controller: :contestant, action: :index
  end


  def destroy
  end
end
