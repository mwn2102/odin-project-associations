class UsersController < ApplicationController
    def new
    end
    
    def create
        
    end
    
    def show
        @user = User.find(params[:id])
        @upcoming_events = @user.upcoming_events
        @prev_events = @user.previous_events
    end
    
end
