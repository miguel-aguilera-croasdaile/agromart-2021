class Listing < ApplicationRecord
  has_one :product
  belongs_to :user
  validates :name, :category, :quantity, :quantity_unit, :price, :address, :currency, presence: true
end
