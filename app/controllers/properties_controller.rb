class PropertiesController < ApplicationController
  before_action :authenticate_property_owner!, only: [:new, :create]

  def show
    id = params[:id]
    @properties = Property.find(id)
  end

  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    @property.property_owner = current_property_owner
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def my_properties
    @properties = current_property_owner.properties
  end

  private

  def property_params
    params.require(:property).permit(:title,:description, 
                                      :rooms, :bathroom, :pets, 
                                      :parking_slot, :daily_rate, 
                                      :property_type_id, :property_location_id)
  end
end
