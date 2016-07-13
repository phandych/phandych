# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.delete_all
Admin.create! username: "phandy", email: "phandy.chandra@gmail.com", password: "foobar"
Category.delete_all
Category.create! name: "flooring and wall"
Category.create! name: "bath and kitchen"
Category.create! name: "building material"
Category.create! name: "electrical and lighting"
Category.create! name: "hardware"
Category.create! name: "tools"
Category.create! name: "houseware"
Category.create! name: "appliances"
Category.create! name: "hobbies"