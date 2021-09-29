class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :category
      t.string :quantity_unit
      t.float :quantity
      t.boolean :available, default: true
      t.boolean :accepts_offers, default: false
      t.string :address
      t.float :price
      t.string :currency
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
