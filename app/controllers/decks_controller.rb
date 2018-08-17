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
    @deck.created_by = current_user

    if @deck.save
      flash[:notice] = ["Your new deck has been added!"]

      redirect_to decks_path
    else
      flash[:alert] = @deck.errors.full_messages
      redirect_to decks_path
    end
  end

  def show
    @deck = Deck.find(params[:id])
    @random_card = @deck.cards.sample

    render :show
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])

    @deck.update_attributes(deck_params)

    if @deck.update(deck_params)
      redirect_to decks_path
    else
      render :edit
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :user, :created_by, :description)
  end
end
