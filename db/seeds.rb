# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new(email:"miguel@gmail.com", password: "123456", password_confirmation: "123456",)
u.save


30.times do
  l = Listing.new(name: "Name", category: "Category", quantity_unit: "Kg", quantity: 100, address:"Santa Lucia, Francisco Morazan", price: 1000, currency: "USD", user: u)
  l.save!
end
