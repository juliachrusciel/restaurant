class FoodsController < Sinatra::Base
  enable  :sessions
  helpers Sinatra::SessionHelper

  # ***** Helpers *****
  def food_params
    return params[:food] if params[:food]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['food'] || body_data
  end

  # ***** Debugging *****
  get '/pry' do
    binding.pry
  end


  # ***** Routes: /api/foods *****
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
  # get '/' do
  #   foods = Food.all
  #   content_type :json
  #   foods.to_json
  # end
  #
  # get '/:id' do
  #   food = Food.find(params[:id])
  #   content_type :json
  #   food.to_json
  # end
  #
  # post '/' do
  #   authenticate_api!
  #   food = Food.create(food_params)
  #   content_type :json
  #   food.to_json
  # end
  #
  # patch '/:id' do
  #   authenticate_api!
  #   food = Food.find(params[:id])
  #   food.update(food_params)
  #   content_type :json
  #   food.to_json
  # end
  #
  # put '/:id' do
  #   authenticate_api!
  #   food = Food.find(params[:id])
  #   food.update(food_params)
  #   content_type :json
  #   food.to_json
  # end
  #
  # delete '/:id' do
  #   authenticate_api!
  #    Food.destroy(params[:id])
  #    content_type :json
  #    {success: "ok"}.to_json
  # end

end
