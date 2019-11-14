def welcome
   welcome_message
   login
   list
end 

def welcome_message
    puts "Welcome to the San Francisco Anti-Social Social Club!"
    sleep(1)
    puts "San Francisco's best hangout hub!"
   sleep(1)
   puts "This is an elite club for elite people to do elite things"
    sleep(1)
    puts "Please enter your username to get started"
end 


def login
    username = gets.chomp
    if User.find_by(username: username)
        $current_user = User.find_by(username: username)
        list_options
        
        list
    else 
        puts "Sorry, this user does not exist, would you like to create an account with this username?"
        sleep(1)
        puts "Type 'yes' to continue or 'no' to abort."
    
            input = gets.chomp
            if input == "no"
                welcome
            elsif input == "yes"
                $current_user = User.create(username: username)
                puts "Great, #{username} is now an active member!"
                sleep(1)
                puts "You will be added to the the elite group of friends in the SFASSC community!"
                sleep(1)
                list_options
                list
            else 
                 puts "invalid selection, returning to homepage..."
             welcome
            end 
    end 



end 

def list
    sleep(1)
    puts "1. Search for events"
    puts "2. View the community"
    puts "3. View your profile"
    puts "4. View SFASSC stats"
    input = gets.chomp
    if input == "1"
        search_events
    elsif input == "2"
        #view_friends
    elsif input == "3"
        #view_profile
    elsif  input == "4"
       # view_stats
    else 
        puts "invalid command, please choose from one of the options below."
        list
    end 

end 

def list_options
    puts "Here's a brief list of things you can do to get started..."
        sleep(1)
        puts "please select a number from the options below to continue"
        sleep(2)
end 





