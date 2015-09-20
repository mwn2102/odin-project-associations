class EventsController < ApplicationController
    def index
        @events_upcoming = Event.upcoming
        @events_prev = Event.past
    end
    
    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)
        if @event.save
            redirect_to @event
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    
    private
        def event_params
            params.require(:event).permit(:description)
        end
end
