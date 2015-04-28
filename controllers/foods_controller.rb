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
  get '/' do
    foods = Food.all
    content_type :json
    foods.to_json
  end

  get '/:id' do
    food = Food.find(params[:id])
    content_type :json
    food.to_json
  end

  post '/' do
    authenticate_api!
    food = Food.create(food_params)
    content_type :json
    food.to_json
  end

  patch '/:id' do
    authenticate_api!
    food = Food.find(params[:id])
    food.update(food_params)
    content_type :json
    food.to_json
  end

  put '/:id' do
    authenticate_api!
    food = Food.find(params[:id])
    food.update(food_params)
    content_type :json
    food.to_json
  end

  delete '/:id' do
    authenticate_api!
     Food.destroy(params[:id])
     content_type :json
     {success: "ok"}.to_json
  end

end
