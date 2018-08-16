class CardsController < ApplicationController
  before_action :authorize

  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def create
    @deck = Deck.find(params[:deck_id])

    @card = Card.new(card_params)
    @card.deck = @deck

    if @card.save
      flash[:notice] = ["Card added successfully!"]

      redirect_to deck_cards_path
    else
      flash[:alert] = @card.errors.full_messages

      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:front, :back, :due, :deck)
  end
end
