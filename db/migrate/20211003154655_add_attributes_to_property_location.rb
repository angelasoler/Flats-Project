class AddAttributesToPropertyLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :property_locations, :name, :string
  end
end
