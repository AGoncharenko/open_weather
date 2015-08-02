class HomeController < ApplicationController
  require 'open_weather'
  include HomesHelper
  def index
    coords = random_coords
    @weather = OpenWeather.geocode(coords[:lat], coords[:lon])
  end

  def get_weather
    @city = home_params[:city].downcase
    @weather = OpenWeather.city(home_params[:city], home_params[:country])
    respond_to do |format|
      format.js
    end
  end

  private
    def home_params
      params.permit(:utf8, :city, :country, :button)
    end
end
