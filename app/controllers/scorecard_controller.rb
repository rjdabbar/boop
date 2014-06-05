class ScorecardController < ApplicationController
  
  def index
  end

  def show
  end

  def delete
  end

  def create
    scorecard = params[:scorecard]
    @user = current_user
    @scorecard = Scorecard.create_from(scorecard, @user)
    
    
    @scorecard.save
    redirect_to controller: :event, action: :show, id: params[:scorecard][:event_id]
  end

  def new
    @scorecard = Scorecard.new
  end

  def edit
    @scorecard = Scorecard.find params[:id]


  end

  def update
    @scorecard = Scorecard.find params[:id]
    @scorecard.update_from(params[:scorecard], @scorecard)
    redirect_to controller: :event, action: :show, id: params[:scorecard][:event_id]

  end

end
