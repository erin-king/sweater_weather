class FlickrService

  def get_background_image_data(latitude, longitude)
    get_json(latitude, longitude)
  end

  def get_image_url(latitude, longitude)
    data = get_background_image_data(latitude, longitude)[0]
    farm = data[:farm]
    server = data[:server]
    id = data[:id]
    secret = data[:secret]
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
  end

  private

  def conn
    Faraday.new("https://www.flickr.com/services/rest/") do |f|
      f.params['api_key'] = ENV['FLICKR_KEY']
      f.params['method'] = 'flickr.photos.search'
      f.params['safe_search'] = 1
      f.params['content_type'] = 1
      f.params['geo_context'] = 2
      f.params['per_page'] = 1
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(latitude, longitude)
    response = conn.get do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
    end
    JSON.parse(response.body, symbolize_names: true)[:photos][:photo]
  end
end
