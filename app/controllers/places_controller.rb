class PlacesController < ApplicationController
  def index
  end

  def show
    cite = session[:current_city]
    cite = cite.downcase
    res_id = params[:id]
    jotain = Rails.cache.read cite
    restaurante = nil
    jotain.each do |thing|
      if thing.id == res_id
        restaurante = thing
      end
    end
    # byebug
    @restaurant = restaurante
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    @weather = WeatherApi.weather_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end
end
