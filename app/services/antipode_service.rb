class AntipodeService
  # def get_antipode_summary(latitude, longitude)
  #   # coords = geocode_service.get_lat_long(location)
  #
  #   # latitude = coords[:lat]
  #   # longitude = coords[:lng]
  #   conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{latitude}&long=#{longitude}") do |f|
  #     f.headers['api_key'] = ENV['AMYPODE_KEY']
  #     f.adapter Faraday.default_adapter
  #   end
  #   response = conn.get
  #   results = JSON.parse(response.body, symbolize_names: true)
  #   # results = {:data=>{:id=>"1", :type=>"antipode", :attributes=>{:lat=>-22.3193039, :long=>-65.8306389}}}
  #   antipode_latitude = results[:data][:attributes][:lat]
  #   antipode_longitude = results[:data][:attributes][:long]
  #   forecast = darksky_service.get_forecast(antipode_latitude, antipode_longitude)
  # end
end
