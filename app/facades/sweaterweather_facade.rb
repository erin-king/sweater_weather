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
    # latitude_longitude
    coords = @geocode_service.get_lat_long('hongkong')
    latitude = coords[:lat]
    longitude = coords[:lng]
    conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{latitude}&long=#{longitude}") do |f|
      f.headers['api_key'] = ENV['AMYPODE_KEY']
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
    # results = {:data=>{:id=>"1", :type=>"antipode", :attributes=>{:lat=>-22.3193039, :long=>-65.8306389}}}
    antipode_latitude = results[:data][:attributes][:lat]
    antipode_longitude = results[:data][:attributes][:long]
    forecast = @darksky_service.get_forecast(antipode_latitude, antipode_longitude)
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
