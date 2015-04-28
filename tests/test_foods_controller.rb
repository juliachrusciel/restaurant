class TestFoodsController < Minitest::Test
  puts "******** TEST FOODS CONTROLLER ********"

  include Rack::Test::Methods

  def app
    FoodsController
  end

  def setup
    Food.destroy_all()
    ActiveRecord::Base.connection.reset_pk_sequence!('foods')
    @food = Food.create({name: 'banana'})
  end

  def test_get_all
    get '/'
    expected = Food.all.to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_get_specific
    get "/#{ @food.id }"
    expected = Food.find(@food.id).to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_create_food
    post '/', {:food => {:name => 'Cheese'} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 'Cheese'
    actual = JSON(last_response.body)['name']
    assert_equal(expected, actual)

    post '/', {:name => 'Tomato'}.to_json, "CONTENT_TYPE" => "application/json"
    expected = 'Tomato'
    actual = JSON(last_response.body)['name']
    assert_equal(expected, actual)
  end

  def test_update_food
    put "/#{ @food.id }", {:food => {:name => 'Apple'} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 'Apple'
    actual = JSON(last_response.body)['name']
    assert_equal(expected, actual)
  end
  def test_update_food
    patch "/#{ @food.id }", {:food => {:name => 'Soda'} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 'Soda'
    actual = JSON(last_response.body)['name']
    assert_equal(expected, actual)
  end

  def test_delete_food
    before_delete = Food.count
    delete "/#{ @food.id }"
    expected = before_delete - 1
    actual = Food.count
    assert_equal(expected, actual)
  end
end
