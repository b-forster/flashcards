class DecksController < ApplicationController
  def index
    @decks = current_user.decks
  end
end
