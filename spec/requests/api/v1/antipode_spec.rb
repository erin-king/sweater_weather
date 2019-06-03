require 'rails_helper'

describe 'Antipode API' do
  it 'sends antipode summary data' do
    get '/api/v1/antipode?loc=hongkong'

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(results[:data][0]).to have_key(:id)
    expect(results[:data][0]).to have_key(:type)
    expect(results[:data][0]).to have_key(:attributes)
    expect(results[:data][0][:attributes]).to have_key(:location_name)
    expect(results[:data][0][:attributes]).to have_key(:forecast)
    expect(results[:data][0][:attributes][:forecast]).to have_key(:summary)
    expect(results[:data][0][:attributes][:forecast]).to have_key(:current_temperature)
    expect(results[:data][0]).to have_key(:search_location)
  end
end
