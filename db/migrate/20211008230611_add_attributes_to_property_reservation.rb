class AddAttributesToPropertyReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :property_reservations, :start_date, :time
    add_column :property_reservations, :end_date, :time
    add_column :property_reservations, :guests, :integer
    add_column :property_reservations, :total_value, :decimal
  end
end
