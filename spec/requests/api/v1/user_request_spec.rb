require 'rails_helper'

describe 'User API', type: :request do
  describe 'POST /api/v1/users' do
    context 'when the request is valid' do
      before { post '/api/v1/users', params: { "email": "whatever@example.com",
                                        "password": "password",
                                        "password_confirmation": "password"}
              }

      it 'creates a user' do

        results = JSON.parse(response.body)

        expect(response).to be_successful
        expect(results["api_key"].length).to eq(22)
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # From Brownfield user.rb check if anything needed for SecureRandom
    # def confirmation_token
    #   self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.nil?
    # end
    # in USER SPEC NOT REQUEST SPEC
  #   describe 'confirmation_token' do
    #   it 'updates a users confirm_token' do
    #     user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)
    #     expect(user.confirm_token).to eq(nil)
    #
    #     user.confirmation_token
    #     expect(user.confirm_token).to_not eq(nil)
    #     expect(user.confirm_token).to be_a(String)
    #   end
    # end

    context 'when the request is invalid' do
      before { post '/api/v1/users', params: { "email": "whatever@example.com" } }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
