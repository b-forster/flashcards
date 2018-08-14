class Card < ApplicationRecord
  belongs_to :deck
  has_one :user, through: :deck

  validates :front, :back, presence: true
end
