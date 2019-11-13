class Event < ActiveRecord::Base
    belongs_to :category
    has_many :user_events
    has_many :users, through: :user_events

    def self.rand_free_event
        while true
            random = events.all.rand
            if random.is_free
                return random
            end
        end
    end

    def search_by_day(day, month, year)
        date = "#{year}-#{month}-#{day}"
        events_by_date = Events.all.find_all do |event|
        event.start_date.to_date.to_s == date
        end
        events_by_date
    end

    def search_by_date_range(day, month, year, to_day, to_month, to_year)
        date1 = "#{year}-#{month}-#{day}".to_date
        date2 = "#{to_year}-#{to_month}-#{to_day}".to_date
        events_by_date = Events.all.find_all do |event|
        event_day =event.start_date.to_date
         if (event > date1) && (event < date2)
            true
         end
        end
        events_by_date
    end

end 