# extract.rb
# https://addons.heroku.com/scheduler

require 'rest-client'
require 'json'

module Forecast  
  class Extract  
    # Default API endpoint
    DEFAULT_FORECAST_IO_API_ENDPOINT = 'https://api.forecast.io'
    
    API_KEY = '7646eeb396a97ec9481b2727933f0e03'
   
    def initialize(latitude, longitude)
      @latitude  = latitude
      @longitude = longitude
      @forecast_url = "#{DEFAULT_FORECAST_IO_API_ENDPOINT}/forecast/#{API_KEY}/#{@latitude},#{@longitude}"
    end
    
    def get_weather_forecast
      parsed = JSON.parse(RestClient.get(URI.encode(@forecast_url)))
      msg = "The current weather summary = "+"#{parsed["currently"]["summary"]}"+" and the temperature in F is "+"#{parsed["currently"]["temperature"].to_s}. "
      if !(parsed["alerts"].nil?)
        msg += "An alert has been issued: "+"#{parsed["alerts"][0]["title"]}"
      end
      return msg
    end
  end  
end 
