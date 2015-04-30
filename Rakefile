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
    f1 = Food.create({name: 'Tomato and Cucumber Salata', price: 2.35})
    f2 = Food.create({name: 'Spinach and Cheese Börek', price: 4.50})
    f3 = Food.create({name: 'Mediterranean Herb Chicken', price: 7.75})
    f4 = Food.create({name: 'Bread', price: 1.25})
    f5 = Food.create({name: 'Baklava', price: 1.45})
    f6 = Food.create({name: 'Ayran Yogurt Drink', price: 2.35})
    f7 = Food.create({name: 'Turkish Tea', price: 1.25})


    p1= Party.create({table_number: 1})
    p2= Party.create({table_number: 2})
    p3= Party.create({table_number: 3})
    p4= Party.create({table_number: 4})

    # p1.orders.create({food: f1})
    # p1.orders.create({food: f2})
    # p1.orders.create({food: f2})
    #
    # p4.orders.create({food: f4})
  end

  desc 'Clear Database'
  task :destroy_all do
    Food.destroy_all
    Party.destroy_all
    Order.destroy_all
  end
end
