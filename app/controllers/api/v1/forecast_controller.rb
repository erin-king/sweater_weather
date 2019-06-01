class Api::V1::ForecastController < ApplicationController
  def show
    # render json: ForecastSerializer.new(Forecast.find(params[:id])) ?
  end
end

# rails g serializer Order id order_number
