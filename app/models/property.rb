class Property < ApplicationRecord
  belongs_to :property_type
  
  belongs_to :property_location

  validates :title, :description, :rooms, :bathroom, :daily_rate, 
            presence: true

  validates :rooms, :bathroom, :daily_rate, 
            numericality: {greater_than: 0}

end
