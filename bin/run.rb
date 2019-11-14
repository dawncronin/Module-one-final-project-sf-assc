require_relative '../config/environment'
require 'pry'

#welcome
#stats
$current_user = User.find_by(username: "dawn")
view_friends


binding.pry
puts "HELLO WORLD"
