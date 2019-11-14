class User < ActiveRecord::Base
    has_many :user_events
    has_many :events, through: :user_events
    has_many :preferences
    has_many :categories, through: :preferences


    def self.most_popular_events
        pop = Hash.new(0)
        User.all.each do |user|
            user.events.each {|event| pop[event.name] += 1 }
        end
        puts pop
    end

  

    def self.most_popular_preferences
        pop = Hash.new(0)
        User.all.each do |user|
            user.categories.each { |cat| pop[cat.name] += 1}
        end
        pop
    end

    def self.most_popular_categories
        pop = Hash.new(0)
        User.all.each do |user|
            user.events.each {|event| pop[event.category] += 1}
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