class PropertiesController < ApplicationController
  def show
    id = params[:id]
    @properties = Property.find(id)
  end

  def new
    @properties = Property.new
  end
  
  def create
    properties = Property.create(params.require(:property).permit(:title,:description, 
                                                                  :rooms, :bathrooms, :pets, 
                                                                  :parking_slot, :daily_rate))

    if @properties.save
      redirect_to property_path(properties.id)
    else
      flash[:alert] = "Todos campos devem ser preenchidos"
      render :new
    end
  end
end
