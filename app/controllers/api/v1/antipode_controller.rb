class Api::V1::AntipodeController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:loc])
    # render json: AntipodeSerializer.new(Antipode.new(facade.antipode_summary))
    render json: facade.antipode_summary
  end
end
