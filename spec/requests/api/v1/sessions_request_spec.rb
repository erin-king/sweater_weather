require 'rails_helper'

describe 'Sessions API', type: :request do
  describe 'POST /api/v1/sessions' do
    context 'when the request is valid' do
      before { post '/api/v1/users', params: { "email": "whatever@example.com",
                                        "password": "password",
                                        "password_confirmation": "password"}
              }
      before :each do
        post '/api/v1/sessions', params: { "email": "whatever@example.com",
                                          "password": "password" }
      end

      it 'creates a session' do

        results = JSON.parse(response.body)

        expect(response).to be_successful
        expect(results["api_key"].length).to eq(22)
      end

      it 'returns a status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the login is invalid' do
      before { post '/api/v1/sessions', params: { "email": "whatever@example.com" } }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
