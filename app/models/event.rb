class Event < ActiveRecord::Base
  has_many :users
  has_many :contestants

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true


  def self.make_date_from(year, month, day)
    date = Date.new(year.to_i, month.to_i, day.to_i)
  end

  def self.create_from_form(name, date)
    Event.create! do |event|
      event.name = name
      event.date = date
    end
  end


end
