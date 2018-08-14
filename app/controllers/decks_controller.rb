class DecksController < ApplicationController
  before_action :authorize
  
  def index
    @decks = current_user.decks
  end
end
