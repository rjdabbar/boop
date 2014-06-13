class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events
  has_many :scorecards

  def remove_from_event(user, event)
    user.destroy_all_scorecards_for_event(user, event)
    event.users.delete(user)
  end

  def destroy_all_scorecards_for_event(user, event)
    Scorecard.where(:user_id => user.id).where(:event_id => event.id).each do |sc|
      sc.destroy
    end
  end

  def destroy_all_scorecards(user)
    Scorecard.where(:user_id => user.id).each do |sc|
      sc.destroy
    end
  end




  def self.add_event_to_user(user, event)
    user.events << event
  end

end
