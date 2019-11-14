def search_events
    puts "Welcome to SF ASSC event search"
    puts "Please select one of the options below by number:"
    puts "1. Search by category"
    puts "2. Search by date"
    puts "3. Search by friends"
    puts "4. Random Event"
    choice = gets.chomp
    if choice =! "1" && choice =! "2" && choice =! "3" && choice =! "4"
        puts "Invalid selection, returning to main menu!"
        #welcome
    elsif choice == "1"
       search_by_category
    elsif choice == "2"
       # search_by_date
    elsif choice == "3"
        #search_by_friends
    elsif choice == "4"
       # random_event
    end
end

def search_by_category
    puts "You have chosen to search by category. The categories are listed below:"
    Category.all.each do |cat|
        puts cat.name
    end
    sleep(1)
    puts "Please type in the name of a category:"
    categ = gets.chomp
    sleep(1)
    if cat = Category.find_by(name: categ)
        selected_events = Event.all.select do |event|
        cat == event.category  
        end
        i = 0
        while true
            puts "#{selected_events[i].name}"
            puts "Description: #{selected_events[i].description}"
            puts "Date: #{selected_events[i].start_date.to_datetime}"
            puts "Please choose one of the following"
            puts "1. RSVP to event"
            puts "2. See next event"
            puts "3. Return to search menu"
                choice = gets.chomp
                if choice == "1"
                    $current_user.save_event(selected_events[i])
                    puts "Event saved to your events!"
                    i += 1
                elsif choice == "2"
                    i += 1
                elsif choice == "3"
                    break
                else
                   puts "Invalid Resonse!"
                   search_by_category
                end
            end
    else
        "Invalid Selection, returning to search by categories"
        search_by_category
    end
end