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

    def self.all_categories
        User.all.map do |user|
            categories = user.categories
            [user.username, categories]
        end
    end

    def self.most_popular_categories
        pop = Hash.new(0)
        User.all.each do |user|
            user.categories.each do |cat|
            pop[cat.name] += 1
        end
    end
        pop
    end

    def save_event(event)
        UserEvent.create(user_id: self.id, event_id: event.id)
    end

    def save_category(category)
        Preference.create(user_id: self.id, category_id: category.id)
    end
    
end