ENV['RACK_ENV'] = 'test'

require './app'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_fail_echo
    get '/'
    assert last_response.ok?
  end

end
