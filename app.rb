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
    @params[:text] = params[:text]
    @params[:location] =  params[:location]
    @params[:details] = params[:details]
    @params[:dates] = params[:start_date] + "T" + params[:start_time] + "/" + params[:end_date] + "T" + params[:end_time]
  end

  def url
    @params.map{|k,v| "&#{k}=#{v}"}.join
  end
end
