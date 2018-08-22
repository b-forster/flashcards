class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, class_name: 'GameCard'
  has_one :user, through: :deck

  before_save :set_initial_cards_count

  def set_initial_cards_count
    self.initial_cards_count = self.cards.size
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
