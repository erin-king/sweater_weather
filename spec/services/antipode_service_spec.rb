require 'rails_helper'

describe AntipodeService do
  describe 'instance methods' do
    it '#get_antipode_first_results' do
      service = AntipodeService.new
      results = service.get_antipode_first_results(22.39, 114.10) #(lat, long)
      # results = {:data=>{:id=>"1", :type=>"antipode", :attributes=>{:lat=>-22.3193039, :long=>-65.8306389}}}
      binding.pry
      expect(results[:data]).to have_key(:id)
      expect(results[:data][:attributes]).to have_key(:lat)
    end

    xit '#get_antipode_summary' do
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
