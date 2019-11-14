class Event < ActiveRecord::Base
    belongs_to :category
    has_many :user_events
    has_many :users, through: :user_events

    def self.rand_free_event
        while true
            random = Event.all.sample
            if random.is_free
                return random
            end
        end
    end

    def self.search_by_day(day, month, year)
        date = "#{year}-#{month}-#{day}"
        events_by_date = Event.all.find_all do |event|
        event.start_date.to_date.to_s == date
        end
        events_by_date
    end

end 