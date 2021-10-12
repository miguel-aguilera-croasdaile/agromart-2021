class Listing < ApplicationRecord
  has_one :product
  belongs_to :user
  validates :name, :category, :quantity, :quantity_unit, :price, :address, :currency, presence: true

  include PgSearch
  pg_search_scope :search_by_name,
  against: { name: 'A'},
  using: { tsearch: { prefix: true }}

end
