class CreatePropertyReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :property_reservations do |t|

      t.timestamps
    end
  end
end
