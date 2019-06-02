class GooglegeocodeService
  def get_lat_long(criteria)
    get_json("geocode/json?address=#{criteria}")
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['GEOCODE_API']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
