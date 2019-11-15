def view_profile
    $current_user.reload
    puts "Welcome, #{$current_user.username}, to your profile!"
    puts "Here are a few things you can do with your profile..."
    puts "Please select a number of one of the options below to continue..."
    puts "1. View your category prefernces"
    puts "2. Update your category prefernces"
    puts "3. View your RSVPs"
    puts "4. Update your RSVPs"
    puts "5. Profile settings"
    puts "6. Return to main menu."
    puts "7. Logout"
    
  

    choice = gets.chomp
    case choice 
     when "1"
        view_category_preferences
     when "2"
        update_category_preferences
     when "3"
        view_rsvps
     when "4"
        update_rsvps
     when "5"
        profile_settings
     when "6"
        list
     when "7"
        logout
     else
        invalid_response(choice)
        view_profile
       
     end 




end 



def view_category_preferences
    if $current_user.categories.reload.length == 0
        puts "You have no preferences."
        puts "Would you like to add preferences?"
        puts "Type 'yes' to update or 'no' to return to your profile."
        choice = gets.chomp
        if choice == 'yes'
            add_category
        elsif choice == 'no'
            view_profile
        else
            invalid_response
            view_category_preferences
        end 
    else


        puts "Your preferences are..." 
        preferences = $current_user.categories.each_with_index do |category, i|
            puts "#{i +1}. #{category.name}"
         end 
        sleep(2)
         puts "Would you like to update your preferences?"
         puts "Type 'yes' to continue or 'no' to return to your profile"
         choice = gets.chomp
         if choice == "yes"
             update_category_preferences
         elsif choice == "no"
             view_profile
         else 
            invalid_response(choice)
            view_category_preferences
         end
    end 

        
end 

def update_category_preferences
    puts "Let's update your preferences"
    puts "Please select a number of one of the options below to continue..."
    puts "1. Remove preference"
    puts "2. Add preference"
    puts "3. Return to profile"
    choice = gets.chomp
    if choice == "1"
        delete_category
    elsif choice == "2"
        add_category
    elsif choice == "3"
        view_profile
    else 
        invalid_response(choice)
        update_category_preferences
    end 


end 

def delete_category
    puts "Your prefernces are..."
    preferences = $current_user.categories.each_with_index do |category, i|
        puts "#{i +1}. #{category.name}"
    end 
    puts "Type the preference you would like to remove"
    choice = gets.chomp
    categ_object = Category.find_by(name: choice)
    
    if  $current_user.categories.include?(categ_object)
        
        $current_user.preferences.each do |preference|
            if categ_object.id == preference.category_id
                preference = Preference.find(preference.id)
                Preference.destroy(preference.id)
                
            end 
        end 
        puts "#{choice} has been removed from your preferences!"
        view_category_preferences
        
    else
        invalid_response(choice)
        delete_category
    end 



end 

def add_category
    puts "What preference would you like add?"
    puts "Please type a preference below "
    Category.all.each do |cat|
        puts "------------------------------"
        puts cat.name
        sleep(0.5)
    end
    choice = gets.chomp
    categ_object = Category.find_by(name: choice)
    
    if $current_user.categories.include?(categ_object)
        puts "This is already included in your preferences. Please add another..."
        add_category
    elsif $current_user.save_category(categ_object)
        puts "#{choice} has been added to your preferences!"
        view_category_preferences
    else invalid_response
        add_category
    end 
end 



def view_rsvps
    puts "Your current RSVPs are..."
    $current_user.events.reload.each_with_index do |event, i|
        puts "#{i +1}. #{event.name}"
    end 
    puts "Would you like to update your RSVPs?"
    puts "Type 'yes' to update or 'no' to view your profile..."
    choice = gets.chomp
    if choice == 'yes'
        update_rsvps
    elsif choice == 'no'
        view_profile
    else 
        invalid_response(choice)
        view_rsvps
    end 


end 

def update_rsvps
    puts "let's update your RSVPs"
    puts "Please select a number of one of the options below to continue"
    puts "1. Remove event"
    puts "2. Add event"
    puts "3. Return to profile"
    choice = gets.chomp
    if choice == "1"
        delete_event
    elsif choice == "2"
        search_events
    elsif choice == "3"
        view_profile
    else 
        invalid_response(choice)
        update_rsvps
    end 

end 

def delete_event
    puts "your RSVPs are..."
     $current_user.events.each_with_index do |event, i|
        puts "#{i +1}. #{event.name}"
    end 
    puts "type the event you would like to remove"
    choice = gets.chomp
    categ_object = Event.find_by(name: choice)
    
    if  $current_user.events.include?(categ_object)
        
        $current_user.events.each do |event|
            if categ_object.id == event.category_id
                event = Event.find(event.id)
                Event.destroy(event.id)
                $current_user.events.reload
             
            end 
        end 
        puts "#{choice} has been removed from your events!"
        view_rsvps
        
    else
        invalid_response(choice)
        delete_event
    end 

end 

def profile_settings
    puts "You can update your profile!"
    puts "choose a number below to continue"
    puts "1. Update your username"
    puts "2. Delete your profile"
    puts "3. Return to profile"
    choice = gets.chomp
    if choice == '1'
        update_username
    elsif choice == '2'
        delete_profile
    elsif choice == '3'
        view_profile
    else
        invalid_response(choice)
        profile_settings
    end 

end 
def delete_profile
    puts "To delete your profile type 'continue'..."
    puts "To return to your profile type 'return'..."
    choice = gets.chomp
    if choice == 'return'
        view_profile
    elsif choice == 'continue'
        User.delete($current_user.id)
        puts "#{$current_user.username}'s account has been deleted'"
        welcome
    else
        invalid_response(choice)
        delete_profile
    end 
end 

def update_username
    puts "Hello #{$current_user.username}!"
    puts "Please enter a new username"
    choice = gets.chomp
    if User.find_by(username: choice )
        exit_program(choice)
        help(choice)
        puts "Sorry this username is already taken"
        puts "please enter another"
        update_username
    else
        exit_program(choice)
        help(choice)
    $current_user.update(username: choice)
    $current_user.reload
    puts "Fantastic! your new username is #{choice}"
    puts "returning to profile"
    view_profile
   
    end 
    
end 


def logout
    welcome
end 