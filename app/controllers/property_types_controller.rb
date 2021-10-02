class PropertyTypesController < ApplicationController
  def show
    id = params[:id]
    @property_type = PropertyType.find(id)
  end

  def new
    @property_type = PropertyType.new
  end

  def create
    @property_type = PropertyType.create(params.require(:property_type).permit(:name))
    if @property_type.save
      flash[:alert] = 'Tipo de imóvel cadastrado com sucesso!'
      redirect_to new_property_path
    elsif @property_type.blank?
      flash[:alert] = 'Campo não pode ficar em branco'
      render :new
    # elsif
    #   flash[:alert] = 'Esse tipo de imóvel já exite'
    #   redirect_to  new_property_path
    end
  end
end  