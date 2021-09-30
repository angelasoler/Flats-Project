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
      redirect_to property_path(properties.id)
    else
      flash[:alert] = "Todos campos devem ser preenchidos"
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:title,:description, 
                                      :rooms, :bathrooms, :pets, 
                                      :parking_slot, :daily_rate, 
                                      :property_type_id)
  end
end
