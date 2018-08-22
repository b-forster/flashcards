class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, class_name: 'GameCard'
  has_one :user, through: :deck

  before_save :set_cards_count

  def set_cards_count
    self.cards_count = self.cards.size
  end
end
