def view_friends
    puts "Please choose and option below:"
    puts "1. See all friends by username"
    puts "2. Search for events by friends' RSVPs"
    puts "3. Search for friends with specific interests"
    puts "4. Return to main menu"
    choice = gets.chomp
    #exit(choice)
    #help(chocie)
    case choice
    when "1"
        puts "Friends Usernames:"
        User.all.each_with_index {|user, i| puts "#{i + 1}. #{user.username}"}
        sleep(2)
        view_friends
    when "2"
        search_by_friends
        
    when "3"
        friends_by_interests
        
    when "4"
        puts "Returning to main menu"
        list
    else
        invalid_response(choice)
        view_friends
    end
end

def friends_by_interests
    puts "You have chosen to find friends by interest. The categories are listed below:" 
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
    #exit_program(choice)
    #help(choice)
    sleep(0.5)
    if cat = Category.find_by(name: categ)
        usernames = cat.users.map {|user| user.username}
        puts "These users have interest in #{cat}:"
        usernames.each_with_index {|user| puts "#{i+1}. #{user}"}
    else
        invalid_response(choice)
        similar_interests
    end
end