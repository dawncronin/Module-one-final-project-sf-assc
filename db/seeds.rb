require_relative '../config/environment'
i = 16

10.times do 
    response = RestClient.get("https://www.eventbriteapi.com/v3/events/search/?q=san%20francisco&token=#{$token}&page=#{i}")
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
    sleep(3)
end 

    # category_response = RestClient.get("https://www.eventbriteapi.com/v3/categories/?token=#{$token}&page=1")
    # category_response_hash = JSON.parse(category_response)
    # all_categories =  category_response_hash["categories"].map do |category|
    #                 name = category["name"]
    #                 id = category["id"]
    #                 {id: id, name:name}
    #                  end 
    # all_categories.each do |category|
    #     Category.create(category)
    # end 
require 'pry'
binding.pry
0