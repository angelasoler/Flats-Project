class HomeController < ApplicationController
  def index
    @properties = Property.all
    @property_type = PropertyType.all
  end
end
