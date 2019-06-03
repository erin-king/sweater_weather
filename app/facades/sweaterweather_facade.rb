class SweaterweatherFacade
  def initialize(location)
    initialize_services
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

  private

  def initialize_services
    @darksky_service = DarkskyService.new
    @flickr_service = FlickrService.new
    @geocode_service = GooglegeocodeService.new
    # @favorites_service = FavoritesService.new
    # @sessions_service = SessionsService.new
    # @users_service = UsersService.new
  end
end

# render json: ForecastSerializer.new(Forecast.find(params[:id])) ?
# rails g serializer Order id order_number
