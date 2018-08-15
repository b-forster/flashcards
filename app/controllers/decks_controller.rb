class DecksController < ApplicationController
  before_action :authorize

  def index
    @decks = current_user.decks
  end

  def new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user

    if @deck.save
      flash[:notice] = "Your new deck has been added!"

      redirect_to decks_path
    else
      flash[:alert] = @deck.errors.full_messages
      redirect_to decks_path
    end
  end

  def show
    @deck = Deck.find(params[:id])

    render :show
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :user)
  end
end
