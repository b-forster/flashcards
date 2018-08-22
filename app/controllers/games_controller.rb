class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    p "*" * 100
    p @remaining_cards = @game.cards.shuffle
    p "*" * 100
  end
end
