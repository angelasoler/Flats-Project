class Property < ApplicationRecord
  belongs_to :property_type

  validates :title, :description, :rooms, :bathroom, :daily_rate, 
            presence: true
end
