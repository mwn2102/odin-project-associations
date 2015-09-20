class AddIdsToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :attendee_id, :integer
    add_index :user_events, :attendee_id
    add_column :user_events, :attended_event_id, :integer
    add_index :user_events, :attended_event_id
    add_index :user_events, [:attendee_id, :attended_event_id], unique: true
  end
end
