class RenameUsersEventsToUserEvents < ActiveRecord::Migration[5.2]
    def change
        rename_table :users_events, :user_events 
    end 
    []
end 