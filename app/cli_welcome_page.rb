def welcome
   welcome_message
   login
   list
end 

def welcome_message
    puts "Welcome to the San Francisco Anti-Social Social Club!"
    sleep(0.5)
    puts "San Francisco's best hangout hub!"
    sleep(0.5)
    puts "This is an elite club for elite people to do elite things"
    sleep(0.5)
    puts "Please type 'help' at any time to see a list of option, or 'exit' to leave the SF ASSC"
    puts "Please enter your username to get started"
end 


def login
    username = gets.chomp
    exit_program(username)
    help(username)
    if User.find_by(username: username)
        $current_user = User.find_by(username: username)
        puts "Welcome back #{username}!"
        
        list
    else 
        puts "Sorry, this user does not exist, would you like to create an account with this username?"
        puts "Type 'yes' to continue or 'no' to abort."
            choice = gets.chomp
            if choice == "no"
                welcome
            elsif choice == "yes"
                $current_user = User.create(username: username)
                puts "Great, #{username} is now an active member!"
                sleep(1)
                puts "You will be added to the the elite group of friends in the SFASSC community!"
                sleep(1)
                
                list
            else 
             invalid_response(choice)
             puts "Returning to homepage..."
             welcome
            end 
    end 



end 

def list
    list_options
    puts "1. Search for events"
    puts "2. View the community"
    puts "3. View your profile"
    puts "4. View SFASSC stats"
    choice = gets.chomp
    if choice == "1"
        search_events
    elsif choice == "2"
        view_friends
    elsif choice == "3"
        view_profile
    elsif  choice == "4"
       stats
    else 
        invalid_response(choice)
        list
    end 

end 

def list_options
    puts "Here's a brief list of things you can do to get started..."
        sleep(0.5)
        puts "Please select a number from the options below to continue"
end 

def invalid_response(choice)
    exit_program(choice)
    help(choice)
    puts "#{choice} is an invalid response. Please choose an appropriate response."
end 

def exit_program(choice)
    if choice == 'exit'
        puts "Goodbye!"
        exit!(2)
    end
end

def help(choice)
    if choice == 'help'
        puts "Oh no! How can I help you?"
        puts "1. Logout"
        puts "2. Exit SF ASSC"
        help_choice = gets.chomp
        exit_program(choice)
        if help_choice == "1"
            welcome
        elsif help_choice == "2"
            exit_program("exit")
        else
            invalid_response(help_choice)
        end
    end
end





