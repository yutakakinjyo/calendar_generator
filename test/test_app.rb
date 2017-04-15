ENV['RACK_ENV'] = 'test'

require './app'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_get_index_page
    get '/'
    assert last_response.ok?
  end

  def test_generate_func
    param = Parameter.new
    param.text = "sample event"
    param.location =  "Japan"
    param.details = "event detail"
    param.start_date = "2017/10/10"
    param.start_time = "100000"
    param.end_date = "2017/10/10"
    param.end_time = "110000"

    assert_equal BASE_URL + "&text=sample event&location=Japan&details=event detail&dates=2017/10/10T100000/2017/10/10T110000", generate(param)
  end

end
