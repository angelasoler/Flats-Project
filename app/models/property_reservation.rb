class PropertyReservation < ApplicationRecord
  class PropertyReservation < ApplicationRecord
    belongs_to :property
    belongs_to :property_tenant
  end
end
