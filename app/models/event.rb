class Event < ActiveRecord::Base
  
  # has_many :contestants
  has_many :scorecards
  has_and_belongs_to_many :contestants
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true


  def self.make_date_from(year, month, day)
    date = Date.new(year.to_i, month.to_i, day.to_i)
  end

  def self.create_from_form(name, date, contestants, user)
    Event.create! do |event|
      event.name = name
      event.date = date
      contestants.each do |con|
        event.contestants << Contestant.find(con)
      end
        event.users << user
    end
    
  end

  def self.add_user_to_event(user, event)
    event.users << user
  end


end
