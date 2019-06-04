class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    api_key = SecureRandom.urlsafe_base64.to_s
    user.api_key = api_key
    if user.save
      render json: { "api_key": api_key }, status: 201
    else
      render json: {}, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
