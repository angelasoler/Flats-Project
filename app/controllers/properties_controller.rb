class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @properties = Property.find(id)
  end

  def new
    @properties = Property.new
  end
  
  def create
    pro = Property.create(params.require(:property).permit(:title,:description, :rooms, :bathrooms, :pets, :parking_slot, :daily_rate))
    redirect_to property_path(pro.id)
  end
end
