class CardsController < ApplicationController
  before_action :authorize

  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end
end
