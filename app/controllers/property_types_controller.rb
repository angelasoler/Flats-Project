class PropertiesTypes < ApplicationController
  def show
    id = params[:id]
    @property_types = PropertyType.find(id)
  end
end  