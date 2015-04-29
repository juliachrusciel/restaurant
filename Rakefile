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
    f1 = Food.create({name: 'Banana', price: 2.35})
    f2 = Food.create({name: 'Cheese', price: 4.50})
    f3 = Food.create({name: 'Salad', price: 7.75})
    f4 = Food.create({name: 'Bread', price: 1.25})

    p1= Party.create({table_number: 1})
    p2= Party.create({table_number: 2})
    p3= Party.create({table_number: 3})
    p4= Party.create({table_number: 4})

    p1.orders.create({food: f1})
    p1.orders.create({food: f2})
    p1.orders.create({food: f2})

    p4.orders.create({food: f4})
  end

  desc 'Clear Database'
  task :destroy_all do
    Food.destroy_all
    Party.destroy_all
    Order.destroy_all
  end
end
