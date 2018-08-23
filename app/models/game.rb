class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, class_name: 'GameCard', dependent: :destroy
  has_one :user, through: :deck

  after_save :generate_and_count_game_cards

  def generate_and_count_game_cards
    due_cards = self.deck.cards.where(due: true)

    set_initial_cards_count(due_cards.size)

    generate_game_cards(due_cards)
  end

  def generate_game_cards(game_cards)

    game_cards.each do |card|
      GameCard.create(game: self, card: card)
    end
  end

  def set_initial_cards_count(num)
    self.initial_cards_count = num
    p "%" * 100
    p "self is " + self.to_s
    p "initial_cards_count is " + self.initial_cards_count.to_s
    p "%" * 100
  end

  def remaining_cards_count
    self.cards.size
  end

  def complete?
    remaining_cards_count == 0
  end

  def increment_reviews_count
    self.reviews_count += 1
  end
end
