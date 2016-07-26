# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(username: "phandy", email: "phandy.chandra@gmail.com", password: "foobar")

Category.create! name: "flooring and wall"
Category.create! name: "bath and kitchen"
Category.create! name: "building material"
Category.create! name: "electrical and lighting"
Category.create! name: "hardware"
Category.create! name: "tools"
Category.create! name: "houseware"
Category.create! name: "appliances"
Category.create! name: "hobbies"

10.times do 
	name = Faker::Commerce.product_name.downcase
	price = Faker::Commerce.price
	sku = Faker::Code.isbn
	model = Faker::Code.asin
	description = Faker::Lorem.paragraph
	Product.create!(name: name,
					sku: sku,
					model: model,
					price: price,
					description: description)
end

 
User.create!(full_name: "Phandy Chandra",
			 email: "phandy@tokourban.com",
			 password: "foobar",
			 password_confirmation: "foobar",
			 activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "foobar"
  User.create!(full_name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
			 activated: true,
             activated_at: Time.zone.now)
end