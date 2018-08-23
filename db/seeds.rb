require 'faker'

GameCard.delete_all
Game.delete_all
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