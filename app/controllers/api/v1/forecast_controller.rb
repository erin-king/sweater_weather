class Api::V1::ForecastController < ApplicationController
  def show
    # SweaterweatherFacade

    # geocode_service = GooglegeocodeService.new
    # results = geocode_service.get_lat_long(params[:location])
    # latitude = results[:lat]
    # longitude = results[:lng]

    # darksky_service = DarkskyService.new
    # results = darksky_service.get_forecast(latitude, longitude)
    # render json: results
  end
end
