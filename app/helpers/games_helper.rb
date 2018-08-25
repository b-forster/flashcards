module GamesHelper
  def render_card(game_id)
    @game = Game.find(game_id)
    @remaining_cards = @game.cards.shuffle
    @deck = @game.deck

    @this_card = Card.find(@remaining_cards.last.card_id)

    if request.xhr?
      render partial: 'cards/review', layout: false, locals: { card: @this_card }
    else
      render 'games/show'
    end
  end
end
