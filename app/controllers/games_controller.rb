class GamesController < ApplicationController
  include GamesHelper

  def show
    render_card(params[:id])
  end

  def correct_answer
    game_card = GameCard.where(card_id: params[:id]).first
    game_card.delete

    game_id = game_card.game_id

    render_card(game_id)
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      flash[:alert] = @game.errors.full_messages
    end
  end

  private

  def game_params
    params.require(:game).permit(:deck, :deck_id)
  end
end
