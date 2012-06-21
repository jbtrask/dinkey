# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_couple!(people = nil)
  if people.present?
    last_person = people[1]
    penultimate_person = people[0]
  else
    people = Person.all
    last_person = people.last
    penultimate_person = people[people.size - 2]
  end
  Couple.create! name: "#{penultimate_person.name} & #{last_person.name}", people: [ penultimate_person, last_person ]
end

Person.create! name: "James Bradford Trask"

Person.create! name: "Travis"
Person.create! name: "Constance"
create_couple!

Person.create! name: "Andy"
Person.create! name: "Candy"
create_couple!

Person.create! name: "Han"
Person.create! name: "Lisa"
create_couple!

Person.create! name: "Jeff"
Person.create! name: "Dawn"
create_couple!

Person.create! name: "Barry"
Person.create! name: "Reese"
create_couple!

Person.create! name: "Katie"
Person.create! name: "Mark"
create_couple!

Person.create! name: "Rachel"
Person.create! name: "Josh"
create_couple!

Person.create! name: "Sofia"
Person.create! name: "Alex"
create_couple!

Person.create! name: "Aram"
Person.create! name: "Tamara"
create_couple!

Person.create! name: "Dawn"
Person.create! name: "Bill"
create_couple!

Person.create! name: "Wendy"
Person.create! name: "Mark"
create_couple!

Person.create! name: "Tarah"
Person.create! name: "Julio"
create_couple!

Person.create! name: "Mike"

Person.create! name: "Marie"
Person.create! name: "Alex"
create_couple!

Person.create! name: "Jordan"

Person.create! name: "Mike"
Person.create! name: "Val"
create_couple!

Person.create! name: "Giaocmo"
Person.create! name: "Wendy"
create_couple!

Person.create! name: "Jonny"
Person.create! name: "Jodi"
create_couple!

Person.create! name: "Dan"
Person.create! name: "Kelly"
create_couple!

Person.create! name: "Aidan"
Person.create! name: "Manny"
create_couple!

Person.create! name: "Jesse"
Person.create! name: "Isis"
create_couple!
