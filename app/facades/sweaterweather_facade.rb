class SweaterweatherFacade
  def initialize(location)
    @location = location
    @latitude = latitude_longitude[:lat]
    @longitude = latitude_longitude[:lng]
  end

  def forecast
    darksky_service.get_forecast(@latitude, @longitude)
  end

  def background_image
    flickr_service.get_image_url(@latitude, @longitude)
  end

  def latitude_longitude
    @_latitude_longitude ||= geocode_service.get_lat_long(@location)
  end

  private

  def darksky_service
    @_darksky_service ||= DarkskyService.new
  end

  def flickr_service
    @_flickr_service ||= FlickrService.new
  end

  def geocode_service
    @_geocode_service ||= GooglegeocodeService.new
  end
# ADD THESE SOON
  # def user_service
  #   @_user_service ||= UserService.new
  # end
  #
  # def sessions_service
  #   @_sessions_service ||= SessionsService.new
  # end
end
