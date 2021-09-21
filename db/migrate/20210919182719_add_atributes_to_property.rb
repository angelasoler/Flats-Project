class AddAtributesToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :parking_slot, :boolean
    add_column :properties, :bathroom, :integer
    add_column :properties, :pets, :boolean
    add_column :properties, :daily_rate, :integer
  end
end
