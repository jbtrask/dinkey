# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create! name: "James Bradford Trask", sort_order: 10

Couple.create! name: "Travis & Constance", sort_order: 10, people: [
  Person.create!(name: "Travis", sort_order: 20, couple_sort_order: 0),
  Person.create!(name: "Constance", sort_order: 30, couple_sort_order: 1)
]

Couple.create! name: "Han & Lisa", sort_order: 20, people: [
  Person.create!(name: "Han", sort_order: 40, couple_sort_order: 0),
  Person.create!(name: "Lisa", sort_order: 50, couple_sort_order: 1)
]