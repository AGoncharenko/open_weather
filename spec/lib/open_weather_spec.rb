require 'spec_helper'

describe OpenWeather do
  it "#geocode lat: 45, lon: 90 should return weather for Beishanyanchi" do
    VCR.use_cassette("Beishanyanchi") do
      weather = OpenWeather.geocode(45, 90)
      weather['cod'].should == 200
      weather['name'].should == 'Beishanyanchi'
      weather['main'].should_not == nil
    end
  end

  it "#city Berlin, DE should return weather for Berlin" do
    VCR.use_cassette("Berlin") do
      weather = OpenWeather.city('Berlin', 'DE')
      weather['cod'].should == 200
      weather['name'].should == 'Berlin'
      weather['main'].should_not == nil
    end
  end
end