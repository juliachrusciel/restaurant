
# ***** TESTS *****
class TestPartiesController < Minitest::Test
  puts "******** TEST PARTIES CONTROLLER ********"

  include Rack::Test::Methods

  def app
    PartiesController
  end

  def setup
    Party.destroy_all()
    ActiveRecord::Base.connection.reset_pk_sequence!('parties')
    @party = Party.create({table_number: 3})
  end

  def test_get_all
    get '/'
    expected = Party.all.to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_get_specific
    get "/#{ @party.id }"
    expected = Party.find(@party.id).to_json
    actual = last_response.body
    assert_equal(expected, actual)
  end

  def test_create_party
    post '/', {:party => {:table_number => 4} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 4
    actual = JSON(last_response.body)['table_number']
    assert_equal(expected, actual)

    # post '/', {:table_number => 6}.to_json, "CONTENT_TYPE" => "application/json"
    # expected = 6
    # actual = JSON(last_response.body)['table_number']
    # assert_equal(expected, actual)
  end

  def test_update_party
    put "/#{ @party.id }", {:party => {:table_number => 7} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 7
    actual = JSON(last_response.body)['table_number']
    assert_equal(expected, actual)
  end
  def test_update_party
    patch "/#{ @party.id }", {:party => {:table_number => 8} }.to_json, "CONTENT_TYPE" => "application/json"
    expected = 8
    actual = JSON(last_response.body)['table_number']
    assert_equal(expected, actual)
  end

  def test_delete_party
    before_delete = Party.count
    delete "/#{ @party.id }"
    expected = before_delete - 1
    actual = Party.count
    assert_equal(expected, actual)
  end
end
