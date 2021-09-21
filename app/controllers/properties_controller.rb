class PropertiesController < ApplicationController
  # def index
  #   @properties = Property.all
  # end

  def show
    @properties = Property.find(params[:id])
  end
end
