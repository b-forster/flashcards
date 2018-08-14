class User < ApplicationRecord
  has_secure_password

  validates :email, :name, presence: true, uniqueness: true

  has_many :decks
  has_many :cards, through: :decks
end
