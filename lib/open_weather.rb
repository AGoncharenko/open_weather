require 'net/http'
require 'json'

class OpenWeather
  class << self
    def geocode(lat, lon)
      Rails.cache.fetch("lat:#{lat};lon:#{lon}", expires_in: 1.hour) do
        parse_response(openweathermap_url+"lat=#{lat}&lon=#{lon}&units=metric")
      end
    end

    def city(city, country)
      Rails.cache.fetch("#{city}:#{country}", expires_in: 1.hour) do
        parse_response(openweathermap_url+"q=#{city},#{country}&units=metric")
      end
    end

    private
    def openweathermap_url
      "http://api.openweathermap.org/data/2.5/weather?"
    end

    def parse_response(request)
      JSON.parse(send_request(request))
    end

    def send_request(request)
      Net::HTTP.get(URI(request))
    end
  end
end