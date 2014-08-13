# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(name: 'KFC', cuisine: 'Chicken')
kfc.reviews.create(rating: 1, thoughts: 'Bit shit')
kfc.reviews.create(rating: 2, thoughts: 'Meh')
kfc.reviews.create(rating: 2, thoughts: 'I was very disappointed in the chicken')
kfc.reviews.create(rating: 5, thoughts: 'Fucking brilliant')
kfc.reviews.create(rating: 3, thoughts: 'Alright')

nandos = Restaurant.create(name: 'Nandos', cuisine: 'Chicken')
nandos.reviews.create(rating: 2, thoughts: 'Bit shit')
nandos.reviews.create(rating: 2, thoughts: 'Meh')
nandos.reviews.create(rating: 2, thoughts: 'I was very disappointed in the chicken')
nandos.reviews.create(rating: 4, thoughts: 'Good shit')
nandos.reviews.create(rating: 3, thoughts: 'Alright')

pizzaexpress = Restaurant.create(name: 'Pizza Express', cuisine: 'Italian')
pizzaexpress.reviews.create(rating: 3, thoughts: 'Lovely stuff')
pizzaexpress.reviews.create(rating: 2, thoughts: 'Meh')
pizzaexpress.reviews.create(rating: 4, thoughts: 'I like pizza')
pizzaexpress.reviews.create(rating: 5, thoughts: 'Fucking ace')
pizzaexpress.reviews.create(rating: 3, thoughts: "I'm Italian")