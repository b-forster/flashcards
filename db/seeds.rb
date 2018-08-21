# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Card.delete_all
Deck.delete_all
User.delete_all


3.times {
  User.create(
    name: Faker::SiliconValley.unique.character,
    email: Faker::SiliconValley.unique.email,
    password: 'test'
  )
}

User.all.each { |user| Deck.create(
    name: Faker::SiliconValley.invention,
    description: Faker::SiliconValley.unique.motto,
    user: user
  )
}

Deck.all.each { |deck| 5.times {
  Card.create(
    front: Faker::SiliconValley.quote,
    back: Faker::SiliconValley.app,
    deck: deck
  )
}

}