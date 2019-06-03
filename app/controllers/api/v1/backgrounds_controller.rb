class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = SweaterweatherFacade.new(params[:location])
    render json: { background_url: facade.background_image }
  end
end
