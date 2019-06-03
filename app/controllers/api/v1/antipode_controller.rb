class Api::V1::AntipodeController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:loc])
    render json: facade.antipode_summary
  end
end
