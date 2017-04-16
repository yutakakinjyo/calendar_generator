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
    gcal = GCalendar.new( text: "sample event",
                          location: "Japan",
                          details: "event detail",
                          start_date: "2017-10-10",
                          start_time: "10:00",
                          end_date: "2017-11-11",
                          end_time: "12:34" )

    assert_equal BASE_URL + "&text=sample event&location=Japan&details=event detail&dates=20171010T100000/20171111T123400", gcal.url
  end

end
