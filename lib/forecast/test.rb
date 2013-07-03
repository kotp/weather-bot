#test.rb

require_relative 'extract'

forecast = Forecast::Extract.new(37.423021, -122.083739)
p forecast.get_weather_forecast