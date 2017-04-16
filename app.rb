# coding: utf-8
require 'sinatra'

BASE_URL = 'https://www.google.com/calendar/event?action=TEMPLATE'

get '/' do
  erb :index 
end

post '/generate' do
  url = GCalendar.new(params).url
  %Q{<a href="#{url}">#{url}</a>}
end

class GCalendar

  def initialize(params)
    @param = Parameter.new(params)
  end

  def url
    BASE_URL + @param.url
  end
end

class Parameter

  def initialize(params)
    @params = {}
    @params[:text]     = params[:text]
    @params[:location] = params[:location]
    @params[:details]  = params[:details]
    @params[:dates]    = dates_format(params[:start_date], params[:end_date])
  end

  def url
    @params.map{|k,v| "&#{k}=#{v}"}.join
  end

  private

  def dates_format(start_date, end_date)
    start_date = DateTime.parse(start_date).strftime("%Y%m%dT%H%M%S")
    end_date = DateTime.parse(end_date).strftime("%Y%m%dT%H%M%S")
    start_date + "/" + end_date
  end

end
