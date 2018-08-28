module GamesHelper
  def render_card(game_id)
    @game = Game.find(game_id)

    if @game.complete?
      render partial: 'cards/complete'
    else
      @remaining_cards = @game.cards.shuffle
      @deck = @game.deck

      next_card = @remaining_cards.last

      until next_card do
        next_card = @remaining_cards.last
      end

      @return_card = Card.find(next_card.card_id)

      if request.xhr?
        render partial: 'cards/review', layout: false, locals: { card: @return_card }
      else
        render 'games/show', locals: { card: @return_card }
      end
    end
  end
end
