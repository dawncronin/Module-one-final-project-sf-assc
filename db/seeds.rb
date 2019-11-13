require_relative '../config/environment'
i = 1

5.times do 
        
        response = RestClient.get("https://www.eventbriteapi.com/v3/events/search/?q=san francisco&token=#{$token}&page=#{i}")
        response_hash = JSON.parse(response)
        all_events = response_hash["events"].map do |event|
            name = event["name"]["text"]
            description = event["description"]["text"]
            category_id = event["category_id"]
            start_date = event["start"]["local"]
            end_date = event["end"]["local"]
            is_free = event["is_free"]
            url = event["url"]
            {name: name, description: description, category_id: category_id, start_date: start_date, end_date: end_date, is_free: is_free, url: url}
        end
     i += 1
     all_events.each do |event| 
        Event.create(event)
     end 
    end 
#require 'pry'
#binding.pry
#0