class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    p @remaining_cards = @game.cards.shuffle

    render :show
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
