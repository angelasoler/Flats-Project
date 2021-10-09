class AddPropertyRefToPropertyReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :property_reservations, :property, null: false, foreign_key: true
  end
end
