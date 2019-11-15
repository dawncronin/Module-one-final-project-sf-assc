def search_events
    puts "Let's find you some events"
    puts "Please select one of the options below by number:"
    sleep(0.5)
    puts "1. Search by category"
    puts "2. Search by date"
    puts "3. Search by friends"
    puts "4. Random Free Event"
    puts "5. Return to Main Menu"
    choice = gets.chomp 
    case choice 
    when "1"
       search_by_category
    when "2"
       search_by_date
    when "3"
        search_by_friends
    when"4"
       random_event
    when "5"
        list
    else 
        invalid_response(choice)
        search_events
    end
end

def search_by_category
    puts "You have chosen to search by category. The categories are listed below:" 
    sleep(0.5)
    Category.all.each do |cat|
        puts "------------------------------"
        puts cat.name
        sleep(0.5)
    end

    puts "------------------------------" 
    sleep(0.5)
    puts "Please type in the name of a category:"
    categ = gets.chomp
    # exit_program(choice)
    # help(choice)
    sleep(0.5)
    if cat = Category.find_by(name: categ)
        selected_events = Event.all.select {|event| cat == event.category }
        if selected_events.empty?
            puts "No results found, returning to search page!" 
            sleep(0.5)
            search_events
        else
            i = 0
            flag = true
            while flag && i < selected_events.length
                list_event(selected_events[i])
                i += 1
            end
        end
    else
        invalid_response(choice)
        search_by_category
    end
    puts "Returning to Main Menu!"
    list
end

def list_event(event)
    puts "---------------------------------------------------------------------"
    puts "#{event.name}"
    sleep(0.1)
    puts "---------------------------------------------------------------------"
    puts "Description: #{event.description}"
    sleep(0.1)
    puts "---------------------------------------------------------------------"
    if event.start_date
    puts "Date: #{event.start_date.to_date}"
    sleep(0.1)
    end
    puts "---------------------------------------------------------------------"
    if event.category
        puts "Category: #{event.category.name}"
        sleep(0.1)
    end
    puts "---------------------------------------------------------------------"
    puts "Free event?: #{event.is_free}"
    sleep(0.1)
    puts "---------------------------------------------------------------------"
    puts "URL: #{event.url}"
    sleep(0.1)
    puts "---------------------------------------------------------------------"
    puts "Please choose one of the following"
    sleep(0.1)
    puts "1. RSVP to event"
    puts "2. See next event"
    puts "3. Return to search menu"
    choice = gets.chomp
    # exit_program(choice)
    # help(choice)
    case choice 
    when "1"
        $current_user.save_event(event)
        puts "Event saved to your events!"
    when "2"
    when "3"
        puts "Returning to Search Menu!"
        search_events
    else
        invalid_response(choice)
        search_events
    end
end

def search_by_date
    puts "You have chosen to search by Date. Please enter a date in mm/dd/yyyy format"
    choice = gets.chomp
    # exit_program(choice)
    # help(choice) 
    if choice.length == 10 
        month = choice[0..1].to_i
        day = choice[3..4].to_i
        year = choice[6..9].to_i
        date_events = Event.search_by_day(day, month, year)
        if !date_events.empty?
            i = 0
            flag = true
            while flag && i < date_events.length
                list_event(date_events[i])
                i += 1
            end
        end
    else
        invalid_response(choice)
        search_by_date
    end
    puts "No results found. Returning to Search Menu!"
    search_events
end

def search_by_friends
    puts "You have chosen to search events by friends. Please enter a friends username:"
    choice = gets.chomp
    # exit_program(choice)
    # help(choice) 
    if friend = User.find_by(username: choice)
        friend_events = friend.events
        if !friend_events.empty?
            i = 0
            flag = true
            while flag && i < friend_events.length
                list_event(friend_events[i])
                i += 1
            end
        else
            puts "No events found, returning to search menu"
            search_events
        end
    else
        puts "Username does not exist, returning to search menu."
        search_events
    end
end

def random_event
    "Here is your random free event!"
    list_event(Event.rand_free_event)
    "Returning to search menu"
    search_events
end
