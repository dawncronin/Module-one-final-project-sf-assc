def stats
    puts "Please pick a statistic by number:"
    puts "1. Most Popular Events"
    puts "2. Most Popular Preferences by user"
    puts "3. Number of friends"
    puts "4. Most Popular Categories by friend's events"
    puts "5. Number of Events"
    puts "6. Return to Main Menu"
    choice = gets.chomp
    #exit(choice)
    #help(choice)
    case choice
    when "1"
        User.most_popular_events
        sleep(1)
        stats
    when "2"
        User.most_popular_preferences
        sleep(1)
        stats
    when "3"
        puts "There are currently #{User.all.length} friends on SF ASSC"
        sleep(1)
        stats
    when "4"
        User.most_popular_categories
        sleep(1)
        stats
    when "5"
        puts "There are currently #{Event.all.length} events on SF ASSC"
        sleep(1)
        stats
    when "6"
        list
    else
        invalid_response(choice)
        sleep(1)
        stats
    end
end