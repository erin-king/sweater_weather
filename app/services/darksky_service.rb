class DarkskyService
  def get_forecast(latitude, longitude)
    get_json("#{latitude},#{longitude}")
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
