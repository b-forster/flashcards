class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, class_name: 'GameCard'
  has_one :user, through: :deck
end
