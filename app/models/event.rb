class Event < ActiveRecord::Base
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, through: :user_events, source: :attendee
    has_many :user_events, foreign_key: :attended_event_id
    
    def self.upcoming
        where("date >= ?", Time.now).order(:date)
    end
    
    def self.past
        where("date <= ?", Time.now).order(:date)
    end
    
    
end

