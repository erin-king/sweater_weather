class Api::V1::ForecastController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:location])
    render json: ForecastSerializer.new(Forecast.new(facade.forecast))
  end
end
