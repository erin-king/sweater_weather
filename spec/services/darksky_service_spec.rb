require 'rails_helper'

describe DarkskyService do
  describe 'instance methods' do
    it '#get_forecast' do
      service = DarkskyService.new
      results = service.get_forecast(39.7392358, -104.990251) #(lat, lng)

      expect(results).to_not eq(nil)
      expect(results[:currently]).to have_key(:summary)
    end
  end
end
