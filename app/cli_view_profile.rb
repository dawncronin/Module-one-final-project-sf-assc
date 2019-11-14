def view_profile
    puts "Welcome #{$current_user.username} to your profile!"
    puts "Here are a few things you can do with your profile..."
    puts "please select a number of one of the options below to continue..."
    puts "1. view your category prefernces"
    puts "2. update your category prefernces"
    puts "3. view your RSVPs"
    puts "4. update your RSVPs"
    puts "5. profile settings"
    puts "6. return to main menu."
    puts "7. logout"
    
  

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
   puts "your preferences are..." 
   preferences = $current_user.categories.each_with_index do |category, i|
            puts "#{i +1}. #{category.name}"
        end 
    sleep(2)
    puts "would you like to update your preferences?"
    puts "type 'yes' to continue or 'no' to return to your profile"
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

def update_category_preferences
    puts "Let's update your preferences"
    puts "Please select a number of one of the options below to continue"
    puts "1. remove preference"
    puts "2. add preference"
    puts "3. return to profile"
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
    puts "your prefernces are..."
    preferences = $current_user.categories.each_with_index do |category, i|
        puts "#{i +1}. #{category.name}"
    end 
    puts "type the preference you would like to remove"
    choice = gets.chomp
    categ_object = Category.find_by(name: choice)
    
    if  
        $current_user.categories.include?(categ_object)
        
        $current_user.preferences.each do |preference|
            if categ_object.id == preference.category_id
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

def view_rsvps
end 

def update_rsvps
end 

def profile_settings
end 

def logout
end 