require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant_database',
)

require './models/food'
require './models/order'
require './models/party'

get '/' do
  erb :index
end

# GET	/api/foods	All food items available
get '/api/foods' do
  foods = Food.all
  content_type :json
  foods.to_json
end

# GET	/api/foods/:id	A single food item and all the parties that included it
get '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  content_type :json
  food.to_json(:include=>:parties)
end

# POST	/api/foods	Creates a new food item
post '/api/foods' do
  food = Food.create(params[:food])
  content_type :json
  food.to_json
end

# PATCH	/api/foods/:id	Updates a food item
patch '/api/foods/:id' do
  food = Food.find(params[:id].to_i).update(params[:food])
  content_type :json
  food.to_json
end
# PUT	/api/foods/:id	Updates a food item
put '/api/foods/:id' do
food = Food.find(params[:id].to_i).update(params[:food])
content_type :json
food.to_json
end
# DELETE	/api/foods/:id	Deletes a food item
delete '/api/foods/:id' do
  food = Food.delete(params[:id].to_i)
  content_type :json
  {message: "Food item deleted"}.to_json
end


##############################################################
###Party######################################################

# GET	/api/parties	All parties
get '/api/parties' do
  parties = Party.all
  content_type :json
  parties.to_json(include: :foods)
end
# GET	/api/parties/:id	A single party and all the orders it contains
get '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  content_type :json
  party.to_json(:include=>[:orders])
end
# POST	/api/parties	Creates a new party
post '/api/parties' do
  party = Party.create(params[:party])
  content_type :json
  party.to_json
end
# PATCH	/api/parties/:id	Updates a party's details
patch '/api/parties/:id' do
  party = Party.find(params[:id].to_i).update(params[:party])
  content_type :json
  party.to_json
end
# PUT	/api/parties/:id	Updates a party's details
put '/api/parties/:id' do
  party = Party.find(params[:id].to_i).update(params[:party])
  content_type :json
  party.to_json
end
# DELETE	/api/parties/:id	Delete a party
delete '/api/parties/:id' do
  party = Party.delete(params[:id].to_i)
  content_type :json
  {message: "Party deleted."}.to_json
end

#############################################
#get all orders
get '/api/orders' do
  orders = Order.all
  content_type :json
  orders.to_json(:include => :food)
end

#get a single order
get '/api/orders/:id' do
  order = Order.find(params[:id].to_i)
  content_type :json
  order.to_json
end

# POST	/api/orders	Creates a new order
post '/api/orders' do
  order = Order.create(params[:order])
  content_type :json
  order.to_json
end
####################################################

# PATCH	/api/orders/:id	Change item to no-charge
patch '/api/orders/:id' do
  order = Order.find(params[:food_id].to_i)

  order.no_charge = true
  order.save!

  content_type :json
  order.to_json(:include=> :foods)
end

# order = Order.find(params[:food_id].to_i).find(params[:name]).update(params[:price])

# DELETE	/api/orders/:id	Removes an order
delete '/api/orders/:id' do
  order = Order.delete(params[:id].to_i)
  content_type :json
  order.to_json
end
# GET	/api/parties/:id/receipt	Saves the party's receipt data to a file.
get '/api/parties/:id/reciept' do
  party = Party.find(params[:id].to_i)
  party = Party.find(params[:check_total])
  party.save!
  content_type :json
  party.to_json(:include=>[:food, :check_total])
  # party = Party.get(params[:id].to_i)
  # edit_party = party.save(params[:check_total])
  # content_type :json
  # edit_party.to_json(:include=>[:food, :price])
end
# PATCH	/api/parties/:id/checkout	Marks the party as paid
patch '/api/parties/:id/checkout' do
  party = Party.find(params[:id].to_i)
  party.paid = true
  party.save!
  content_type :json
  party.to_json
end
# PUT	/api/parties/:id/checkout	Marks the party as paid
put '/api/parties/:id/checkout' do
  party = Party.find(params[:id].to_i).update(params[:table_number])
  party = Party.paid(puts :true)
  content_type :json
  party.to_json
end
