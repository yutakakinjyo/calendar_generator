# coding: utf-8
require 'sinatra'

get '/' do
  erb :index 
end

class Parameter
  attr_accessor :text, :location, :details, :start_date, :start_time, :end_date, :end_time

  def dates
    @start_date + "T" + @start_time + "/" + @end_date + "T" + @end_time
  end
  
end

BASE_URL = 'http://www.google.com/calendar/event?action=TEMPLATE'

post '/generate' do

  param = Parameter.new
  param.text = params[:text]
  param.location =  params[:location]
  param.details = params[:details]
  param.start_date = params[:start_date]
  param.start_time = params[:start_time]
  param.end_date = params[:end_date]
  param.end_time = params[:end_time]

  url = generate(param)
  
  %Q{<a href="#{url}">#{url}</a>}
  
end


def generate(param)
  BASE_URL +
    "&text=#{param.text}" +
    "&location=#{param.location}" +
    "&details=#{param.details}" +
    "&dates=#{param.dates}"
end
