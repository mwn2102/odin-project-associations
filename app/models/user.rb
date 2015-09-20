class User < ActiveRecord::Base
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"
    has_many :attended_events, through: :user_events
    has_many :user_events, foreign_key: :attendee_id

    def upcoming_events
        self.attended_events.where("date >= ?", Time.now).order(:date)
    end
    
    def previous_events
        self.attended_events.past
        # self.attended_events.where("date <= ?", Time.now).order(:date)    can use the past scope defined in event model
    end
end
