class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @properties = Property.find(id)
  end

  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:title,:description, 
                                      :rooms, :bathroom, :pets, 
                                      :parking_slot, :daily_rate, 
                                      :property_type_id, :property_location_id)
  end
end
