class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.new(user_params)
    api_key = SecureRandom.urlsafe_base64.to_s
    user.api_key = api_key
    if user.save
      render json: { "api_key": api_key }
    else
      render json: { status: "error", code: 401 }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

# class Api::V1::UsersController < ApplicationController
#   def create
#     user = User.new(user_params)
#     if user.save
#       user_key = {api_key: SecureRandom.hex}
#       user.update(user_key)
#       render json: user_key, status: :created
#     else
#       render nothing: true, status: :bad_request
#     end
#   end
#
# end
