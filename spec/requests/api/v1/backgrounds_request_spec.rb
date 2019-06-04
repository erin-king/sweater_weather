require 'rails_helper'

describe 'Backgrounds API', type: :request do
  it 'sends data to request image url' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.body).to_not eq(nil)
  end
end
