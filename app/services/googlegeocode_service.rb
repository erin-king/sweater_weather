class GooglegeocodeService
  def get_lat_long(criteria)
    # conn = Faraday.new('https://maps.googleapis.com/maps/api') do |f|
    conn = Faraday.new('https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=AIzaSyB1jFkCyqI0pMD35LsEhrZkmDDMulItGbc') do |f|
      # f.params['key'] = ENV['GEOCODE_API']
      # f.params['key'] = 'AIzaSyB1jFkCyqI0pMD35LsEhrZkmDDMulItGbc'
      f.adapter Faraday.default_adapter
    end

    # response = conn.get("/geocode/json?address=#{criteria}")
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
