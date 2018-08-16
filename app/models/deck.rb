class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :created_by, class_name: 'User', foreign_key: :user_id
  has_many :cards

  validates :name, presence: true, :uniqueness => {:scope=>:user_id, message: 'is already in use'}
end
