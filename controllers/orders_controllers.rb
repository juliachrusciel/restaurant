class OrdersController < Sinatra::Base
  enable  :sessions

  # ***** Helpers *****
  def order_params
    return params[:order] if params[:order]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['order'] || body_data
  end

  # ***** Debugging *****
  get '/pry' do
    binding.pry
  end


  # ***** Routes: /api/orders *****
  get '/' do
    orders = Order.all
    content_type :json
    orders.to_json
  end

  get '/:id' do
    order = Order.find(params[:id])
    content_type :json
    order.to_json
  end

  post '/' do
    order = Order.create(order_params)
    content_type :json
    order.to_json
  end

  patch '/:id' do
    order = Order.find(params[:id])
    order.update(order_params)
    content_type :json
    order.to_json
  end

  put '/:id' do
    order = Order.find(params[:id])
    order.update(order_params)
    content_type :json
    order.to_json
  end

  delete '/:id' do
     Order.destroy(params[:id])
     content_type :json
     {success: "ok"}.to_json
  end

end
