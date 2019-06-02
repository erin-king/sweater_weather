require 'rails_helper'

describe 'Backgrounds API' do
  it 'sends data to request image url' do
    get '/api/v1/backgrounds?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(results[0]).to have_key(:id)
    expect(results[0]).to have_key(:owner)
  end
end
