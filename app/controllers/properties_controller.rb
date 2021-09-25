class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @properties = Property.find(id)
  end
end
