## Welcome to the San Francisco Anti Social Club

This is an CLI app to view events in San Francisco based off of the EventBrite API!

If you would like to use this CLI yourself, here are the steps to configuring it to your computer:
1. Get a API key from EventBriteAPI.com
2. add a key.text file with the api key
3. Seed your database with catagories and events. These are in the db/seeds.rb file, and you will need to change the city to your city.
4. Run rake db:migrate
5. Run ruby db/seeds.rb
6. Run bin/run/rb
