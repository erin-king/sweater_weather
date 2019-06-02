class Api::V1::ForecastController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:location])
    render json: facade.forecast
  end
end
