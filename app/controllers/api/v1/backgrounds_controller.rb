class Api::V1::BackgroundsController < ApplicationController
  def show
    geocode_service = GooglegeocodeService.new
    results = geocode_service.get_lat_long(params[:location])
    latitude = results[:lat]
    longitude = results[:lng]
    flickr_service = FlickrService.new
    results = flickr_service.get_background_image(latitude, longitude)
    # render json: results
    # render json: BackgroundsSerializer.new(Backgrounds.find(params[:id])) ?
  end
end
