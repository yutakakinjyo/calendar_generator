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
                          start_date: "20171010",
                          start_time: "100000",
                          end_date: "20171010",
                          end_time: "110000" )

    assert_equal BASE_URL + "&text=sample event&location=Japan&details=event detail&dates=20171010T100000/20171010T110000", gcal.url
  end

end
