class SweaterweatherFacade
  def initialize(location)
    @darksky_service = DarkskyService.new
    @flickr_service = FlickrService.new
    @geocode_service = GooglegeocodeService.new
    @location = location
    @latitude = latitude_longitude[:lat]
    @longitude= latitude_longitude[:lng]
  end

  def forecast
    @darksky_service.get_forecast(@latitude, @longitude)
  end

  def background_image
    @flickr_service.get_image_url(@latitude, @longitude)
  end

  def latitude_longitude
    @_latitude_longitude ||= @geocode_service.get_lat_long(@location)
  end
end

# render json: ForecastSerializer.new(Forecast.find(params[:id])) ?
# rails g serializer Order id order_number
