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
        pop = pop.sort_by{ |event, count| count}
        i = 0
        pop.reverse.each do |event, count|
            unless i > 4
            puts "#{count} friend(s) are going to #{event}"
            i += 1
            end
        end
    end

  

    def self.most_popular_preferences
        pop = Hash.new(0)
        User.all.each do |user|
            user.categories.each { |cat| pop[cat.name] += 1}
        end
        pop = pop.sort_by{ |cat, count| count}
        i = 0
        pop.reverse.each do |cat, count|
            unless i > 5
            puts "#{count} friends(s) are interested in #{cat}"
            i += 1
            end
        end
    end

    def self.most_popular_categories
        pop = Hash.new(0)
        User.all.each do |user|
            user.events.each {|event| pop[event.category] += 1}
        end
        pop = pop.sort_by{ |cat, count| count}
        i = 0
        pop.reverse.each do |cat, count|
            unless i > 4
            if cat
                cat_name = cat.name
            else
                cat_name = "Other"
            end
            puts "#{count} RSVPS are for events about #{cat_name}"
            i += 1
            end
        end
    end

    def save_event(event)
        if !self.events.include?(event)
        UserEvent.create(user_id: self.id, event_id: event.id)
        end
    end

    def save_category(category)
        if !self.categories.include?(category)
        Preference.create(user_id: self.id, category_id: category.id)
        end
    end
    
end