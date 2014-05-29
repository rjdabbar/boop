class ScorecardController < ApplicationController
  def index
  end

  def show
  end

  def delete
  end

  def create

    scorecard = params[:scorecard]
    @scorecard = Scorecard.create_from(scorecard)
    @scorecard.save
    redirect_to controller: :event, action: :show, id: params[:scorecard][:event_id]
  end

  def new
    @scorecard = Scorecard.new
  end

  def edit
  end
end