class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)

    if user && user.authenticate(params[:login][:password])
      session[:id] = user.id
      redirect_to decks_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password. Try again."
      render :new
    end
  end

  def destroy
    session.delete(:id)
    redirect_to login_path, notice: "Logged out!"
  end
end
