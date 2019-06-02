require 'rails_helper'

describe FlickrService do
  describe 'instance methods' do
    it '#get_background_image' do
      service = FlickrService.new
      results = service.get_background_image_data(39.7392358, -104.990251)[0]

      expect(results).to have_key(:id)
      expect(results).to have_key(:owner)
      expect(results).to have_key(:secret)
      expect(results).to have_key(:server)
      expect(results).to have_key(:farm)
    end

    it '#get_image_url' do
      service = FlickrService.new
      data = service.get_background_image_data(39.7392358, -104.990251)[0]
      result = service.get_image_url(39.7392358, -104.990251)
      farm = data[:farm]
      server = data[:server]
      id = data[:id]
      secret = data[:secret]

      expect(result).to eq("https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg")
    end
  end
end
# FOR URL "id": "47975311648", "owner": "51035555243@N01", "secret": "dd30e389be", "server": "65535", "farm": 66
# {
#     "photos": {
#         "page": 1,
#         "pages": 718,
#         "perpage": 250,
#         "total": "179482",
#         "photo": [
#             {
#                 "id": "47985220261",
#                 "owner": "47406118@N03",
#                 "secret": "a5f891f14e",
#                 "server": "65535",
#                 "farm": 66,
#                 "title": "Brown Palace",
#                 "ispublic": 1,
#                 "isfriend": 0,
#                 "isfamily": 0
#             },
#             {
#                 "id": "47978045691",
#                 "owner": "77903093@N00",
#                 "secret": "5c5cfe5f1e",
#                 "server": "65535",
#                 "farm": 66,
#                 "title": "190320 Denver Botanical Gardens-14.jpg",
#                 "ispublic": 1,
#                 "isfriend": 0,
#                 "isfamily": 0
#             },



# https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
#
# https://farm66.staticflickr.com/65535/47975311648_dd30e389be.jpg
#
#  { "id": "47975311648", "owner": "51035555243@N01", "secret": "dd30e389be", "server": "65535", "farm": 66
