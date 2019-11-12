class User < ActiveRecord::Base
    has_many :user_events
    has_many :events, through: :user_events
    has_many :preferences
    has_many :categories, through: :preferences

end