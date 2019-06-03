class AntipodeService

  def get_antipode_first_results(latitude, longitude)
    conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{latitude}&long=#{longitude}") do |f|
      f.headers['api_key'] = ENV['AMYPODE_KEY']
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{latitude}&long=#{longitude}") do |f|
      f.headers['api_key'] = ENV['AMYPODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
