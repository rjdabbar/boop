class ContestantController < ApplicationController
  def new
  end

  def show
  end

  def index
    @contestants = Contestant.all
  end

  def edit
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
