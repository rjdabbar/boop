class Contestant < ActiveRecord::Base

# belongs_to :event
has_many :scorecards
has_and_belongs_to_many :events


  def self.create_from_params(name)
    create! do |c|
      c.name = name
    end
  end
###########   MAYBE WHAT I NEED TO ADD
  # def self.set_event_ids_from(ids, event_id)
  #   ids.each do |x|
  #     contestant = Contestant.find_by_id(x)
  #     contestant.event_id << event_id
  #     contestant.save!
  #   end
  # end
##########

    def self.set_event_ids_from(ids, event_id)
    ids.each do |x|
      contestant = Contestant.find_by_id(x)
      contestant.event_id = event_id
      contestant.save!
    end
  end

end
