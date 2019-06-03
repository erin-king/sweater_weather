require 'rails_helper'

describe AntipodeService do
  describe 'instance methods' do
    it '#get_antipode_summary' do
      service = AntipodeService.new
      results = service.get_antipode_summary(22.39, 114.10) #(lat, long)

      expect(results).to_not eq(nil)
      expect(results).to have_key(:latitude)
      expect(results).to have_key(:longitude)
      expect(results).to have_key(:currently)
      expect(results[:currently]).to have_key(:summary)
      expect(results[:currently]).to have_key(:temperature)
    end
  end
end
