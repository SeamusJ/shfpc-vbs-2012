# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
anna = User.create!(login: 'Anna', password:'Scarlett', password_confirmation: 'Scarlett', email: 'AnnaKochJohnson@gmail.com', created_at: '11-June-2012')
