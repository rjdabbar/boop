class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :contestant
  belongs_to :event

  def self.create_from(hash)
    Scorecard.create! do |sc|
      sc.lyrics = hash[:lyrics].to_i
      sc.stage_presence = hash[:stage_presence].to_i
      sc.creativity = hash[:creativity].to_i
      sc.delivery_and_flow = hash[:delivery_and_flow].to_i
      sc.crowd_response = hash[:crowd_response].to_i
      sc.event_id = hash[:event_id]
      sc.contestant_id  = hash[:contestant_id]
      sc.total = (sc.lyrics + sc.stage_presence + sc.creativity + sc.crowd_response + sc.delivery_and_flow)
      sc.name = hash[:name]
    end
  end

  










end




