class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  enum :ice_type, [:cubo, :triturado, :escama]
  
  has_one_attached :image
  
end
