# ***** GEMS *****
require 'bundler/setup'
Bundler.require(:default, :test)

# ***** Load Testing GEMS *****
require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'

# ***** Test Display *****
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

# ***** CONNECTION *****
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant_database'
)

# ***** MODELS *****
require File.expand_path('./../../models/party', __FILE__)
require File.expand_path('./../../models/food', __FILE__)
require File.expand_path('./../../models/order', __FILE__)


# ***** CONTROLLERS *****
require File.expand_path('./../../controllers/foods_controller', __FILE__)
require File.expand_path('./../../controllers/parties_controller', __FILE__)
require File.expand_path('./../../controllers/orders_controller', __FILE__)


# ***** TESTS *****
require File.expand_path('./../test_parties_controller', __FILE__)
require File.expand_path('./../test_foods_controller', __FILE__)
require File.expand_path('./../test_orders_controller', __FILE__)
