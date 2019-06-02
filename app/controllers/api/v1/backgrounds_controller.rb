class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:location])
    render json: facade.background_image
  end
end
