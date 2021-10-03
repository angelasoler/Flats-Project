class PropertyLocationsController < ApplicationController
  def show
    id = params[:id]
    @property_locations = PropertyLocation.find(id)
  end

  def new
    @property_location = PropertyLocation.new
  end

  def create
    @property_location = PropertyLocation.create(params.require(:property_location).permit(:name))
    if @property_location.save
      flash[:alert] = 'Região cadastrada com sucesso!'
      redirect_to new_property_path
    else
      render :new
    end
  end
end  
