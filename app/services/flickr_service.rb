class FlickrService

  def get_background_image(latitude, longitude)
    conn = Faraday.new("https://www.flickr.com/services/rest/") do |f|
      f.params['api_key'] = ENV['FLICKR_KEY']
      f.params['method'] = 'flickr.photos.search'
      f.params['safe_search'] = 1
      f.params['content_type'] = 1
      f.params['geo_context'] = 2
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1

      f.adapter Faraday.default_adapter
    end
    response = conn.get do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
    end
    results = JSON.parse(response.body, symbolize_names: true)[:photos][:photo]
  end

  private






  # def get_background_image(latitude, longitude)
  #   get_json("lat=#{latitude}&lon=#{longitude}")
  # end
  #
  # private
  #
  # def conn
  #   Faraday.new('https://www.flickr.com/services/rest/') do |f|
  #     f.params['api_key'] = ENV['FLICKR_KEY']
  #     f.adapter Faraday.default_adapter
  #   end
  # end
  #
  # def get_json(url)
  #   response = conn.get(url) do |req|
  #     # req.url = url
  #     req.params['method'] = 'flickr.photos.search'
  #     req.params['safe_search'] = 1
  #     req.params['content_type'] = 1
  #     req.params['geo_context'] = 2
  #     req.params['format'] = 'json'
  #     req.params['nojsoncallback'] = 1
  #   end
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end

# https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=3ad0644dacb9f8aa4d143d7084978d04&safe_search=1&content_type=1&geo_context=2&lat=39.7392358&lon=-104.990251&format=json&nojsoncallback=1
