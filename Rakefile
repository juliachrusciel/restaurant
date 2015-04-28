require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant_database',
)

require './models/food'
require './models/order'
require './models/party'
require './models/user'



namespace :db do
  desc 'Generate Random Data'
  task :junk_data do
    food = Food.create({name: 'Banana'})
    party = Party.create({table_number: 4})
    Order.create({food: food, party: party})
  end

  desc 'Clear Database'
  task :destroy_all do
    Food.destroy_all
    Party.destroy_all
    Order.destroy_all
  end
end
