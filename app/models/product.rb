class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  enum :ice_type, [:cubo, :triturado, :escama]
end
