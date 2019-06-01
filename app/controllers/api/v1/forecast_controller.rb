class Api::V1::ForecastController < ApplicationController
  def show
    # render json: ForecastSerializer.new(Forecast.find(params[:id])) ?
  end
end
