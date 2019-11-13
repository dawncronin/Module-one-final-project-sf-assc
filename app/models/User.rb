class User < ActiveRecord::Base
    has_many :user_events
    has_many :events, through: :user_events
    has_many :preferences
    has_many :categories, through: :preferences


    def self.popular_events
        User.all.map do |user|
            events = user.events.name
            [user.username, events]
        end
    end

    def self.popular_categories
        User.all.map do |user|
            categories = user.preferences.categories
            [user.username, categories]
        end
    end

    def save_event(event)
        UserEvent.new(user_id: self.id, event_id: event.id)
    end

    def save_category(category)
        Preference.new(user_id: self.id, category_id: category.id)
    end



    
end