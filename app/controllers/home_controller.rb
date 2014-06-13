class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user.admin?
      redirect_to controller: :event, action: :index
    end
  end
end
