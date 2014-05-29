class Contestant < ActiveRecord::Base

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

end
