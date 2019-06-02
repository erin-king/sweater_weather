require 'rails_helper'

describe FlickrService do
  describe 'instance methods' do
    it '#get_background_image' do
      service = FlickrService.new
      results = service.get_background_image(39.7392358, -104.990251)

      expect(results[0]).to have_key(:id)
      expect(results[0]).to have_key(:owner)
      expect(results[0]).to have_key(:secret)
      expect(results[0]).to have_key(:server)
      expect(results[0]).to have_key(:farm)
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
