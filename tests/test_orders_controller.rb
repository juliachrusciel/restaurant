
# ***** TESTS *****
class TestOrdersController < Minitest::Test
  puts "******** TEST ORDERS CONTROLLER ********"

  include Rack::Test::Methods

  def app
    OrdersController
  end

  def setup
    Order.destroy_all()
    ActiveRecord::Base.connection.reset_pk_sequence!('orders')
    @food = Food.create()
    @party = Party.create()
    @order = Order.create({food: @food, party: @party})
  end

  def test_get_all
    get '/'
    expected = Order.all.to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_get_specific
    get "/#{ @order.id }"
    expected = Order.find(@order.id).to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_create_order
    post '/', {:order => {:food_id => 2} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 2
    actual = JSON(last_response.body)['food_id']
    assert_equal(expected, actual)

    # post '/', {:table_number => 6}.to_json, "CONTENT_TYPE" => "application/json"
    # expected = 6
    # actual = JSON(last_response.body)['table_number']
    # assert_equal(expected, actual)
  end

  def test_update_order
    put "/#{ @order.id }", {:order => {:food_id => 7} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 7
    actual = JSON(last_response.body)['food_id']
    assert_equal(expected, actual)
  end
  def test_update_order
    patch "/#{ @order.id }", {:order => {:party_id => 8} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 8
    actual = JSON(last_response.body)['party_id']
    assert_equal(expected, actual)
  end

  def test_delete_order
    before_delete = Order.count
    delete "/#{ @order.id }"
    expected = before_delete - 1
    actual = Order.count
    assert_equal(expected, actual)
  end
end
