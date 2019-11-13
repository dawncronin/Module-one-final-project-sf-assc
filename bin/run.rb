require_relative '../config/environment'
require 'pry'

10.times do
    User.create(username: Faker::Twitter.screen_name) 
    Event.create(name: Faker::Cannabis.strain )
    Category.create(name: Faker::ChuckNorris.fact)
end 

15.times do
    user = User.all.sample
    event = Event.all.sample
    category = Category.all.sample
    Preference.create(user_id: user.id, category_id: category.id)
    UserEvent.create(user_id: user.id, event_id: event.id)
end 


binding.pry
puts "HELLO WORLD"
