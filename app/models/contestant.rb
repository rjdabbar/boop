class Contestant < ActiveRecord::Base

validates :name, presence: true, uniqueness: true
# belongs_to :event
has_many :scorecards
has_and_belongs_to_many :events


  def self.create_from_params(name)
    create! do |c|
      c.name = name
    end
  end

  def add_event_to(contestant, event)
    Contestant.find(contestant).events << Event.find(event)
  end


  def find_sc_by_name_and_event(scorecards, name, event)
    scorecards.detect{ |sc| sc.name == name && sc.event.id == event.id}
  end

    def find_sc_by_name_and_event_and_user(scorecards, name, event, user)
    scorecards.detect{ |sc| sc.name == name && sc.event.id == event.id && sc.user.id == user.id}
  end

  def score_event(scorecards, event, user)
    score = 0
    scorecards.each do |sc|
      if (sc.event.id == event.id && sc.user.id == user.id)
        score = score + sc.total
      end 
    end
    score
  end

  def get_total_score_for_the_event(scorecards, event)

    
    score = 0
    scorecards.each do |sc|
      if (sc.event.id == event.id)
        score = score + sc.total
      end
    end  
    score
  end

  def total_score(scorecards, event, users)
    score = 0
    users.each do |j|
      score = score + score_event(scorecards, event, j)
    end
  score
  end


  def get_total_score_for_event(scorecards, event, user)

    
    score = 0
    scorecards.each do |sc|
      if (sc.event.id == event.id && sc.user.id == user.id)
        score = score + sc.total
      end
    end  
    score
  end


end
