class AddPropertyTenantRefToPropertyReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :property_reservations, :property_tenant, null: false, foreign_key: true
  end
end
