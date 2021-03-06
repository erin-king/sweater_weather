require 'rails_helper'

describe 'Forecast API', type: :request do
  it 'sends forecast data' do
    get '/api/v1/forecast?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(response).to be_successful
    expect(results[:currently]).to have_key(:summary)
  end
end
