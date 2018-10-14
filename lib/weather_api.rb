class WeatherApi
  def self.weather_in(city)
    city = city.downcase
    Rails.cache.fetch(city, expires_in: 1.hour){ get_weather_in(city) }
  end

  def self.get_weather_in(city)
    url = "http://api.apixu.com/v1/current.json?key=#{adskey}"

    response = HTTParty.get "#{url}&q=#{ERB::Util.url_encode(city)}"
    # byebug
    # varavar = "moimoi"
    # weather = response.parsed_response
  end

  def self.adskey
    "67ec9cba0a714af794e202636180710"
  end
end
