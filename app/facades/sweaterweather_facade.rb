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

  def antipode_summary
    results = @antipode_service.get_antipode_first_results(@latitude, @longitude)
    antipode_latitude = results[:data][:attributes][:lat]
    antipode_longitude = results[:data][:attributes][:long]
    forecast = @darksky_service.get_forecast(antipode_latitude, antipode_longitude)
  end

  private

  def initialize_services
    @darksky_service = DarkskyService.new
    @flickr_service = FlickrService.new
    @geocode_service = GooglegeocodeService.new
    @antipode_service = AntipodeService.new
    # @favorites_service = FavoritesService.new
    # @sessions_service = SessionsService.new
    # @users_service = UsersService.new
  end
end
