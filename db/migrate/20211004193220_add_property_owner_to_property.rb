class AddPropertyOwnerToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :property_owner, :reference
  end
end
