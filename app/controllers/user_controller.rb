class UserController < ApplicationController
    before_action :check_admin?

  def index
    @users = User.all
  end

  def destroy
    if  @user = User.find(params[:id])
      @user.destroy_all_scorecards(@user)
      @user.destroy

      redirect_to controller: :user, action: :index
    end
   
  end

  def edit
  end

  def update
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.remove_from_event(@user, @event)

    redirect_to controller: :event, action: :show
  end





 private

  def check_admin?
    if current_user.admin?
      true
    else
      redirect_to controller: :event, action: :index
    end
  end
end
