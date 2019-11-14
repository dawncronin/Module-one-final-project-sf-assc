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
    if choice == "1"
       search_by_category
    elsif choice == "2"
       search_by_date
    elsif choice == "3"
        search_by_friends
    elsif choice == "4"
       random_event
    elsif choice == "5"
        list
    else 
        puts "Invalid selection, returning to main menu!"
        list
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
    sleep(0.5)
    if cat = Category.find_by(name: categ)
        selected_events = Event.all.select {|event| cat == event.category }
        if selected_events.empty?
            puts "No results found, returning to search page!" 
            sleep(1)
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
        puts "Invalid Selection, returning to search page"
        search_by_category
    end
    puts "Returning to Main Menu!"
    list
end

def list_event(event)
    puts "---------------------------------------------------------------------"
    puts "#{event.name}"
    sleep(0.5)
    puts "---------------------------------------------------------------------"
    puts "Description: #{event.description}"
    sleep(1)
    puts "---------------------------------------------------------------------"
    puts "Date: #{event.start_date.to_date}"
    sleep(0.5)
    puts "---------------------------------------------------------------------"
    puts "Category: #{event.category.name}"
    sleep(0.5)
    puts "---------------------------------------------------------------------"
    puts "Free event?: #{event.is_free}"
    sleep(0.5)
    puts "---------------------------------------------------------------------"
    puts "Please choose one of the following"
    sleep(0.5)
    puts "1. RSVP to event"
    puts "2. See next event"
    puts "3. Return to search menu"
    choice = gets.chomp
    if choice == "1"
        $current_user.save_event(event)
        puts "Event saved to your events!"
    elsif choice == "2"
    elsif choice == "3"
        puts "Returning to Search Menu!"
        search_events
    else
        puts "Invalid Response!"
        search_events
    end
end

def search_by_date
    puts "You have chosen to search by Date. Please enter a date in mm/dd/yyyy format"
    choice = gets.chomp
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
        puts "Invalid Response, returning to search menu."
        search_events
    end
    puts "No results found. Returning to Search Menu!"
    search_events
end

def search_by_friends
    puts "You have chosen to search events by friends. Please enter a friends username:"
    choice = gets.chomp
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
        puts "username does not exist, returning to search menu."
        search_events
    end
end

def random_event
    "Here is your random free event!"
    list_event(Event.rand_free_event)
    "Returning to search menu"
    search_events
end
