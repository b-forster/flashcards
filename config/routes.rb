Rails.application.routes.draw do
  root to: 'users#new'
    
    # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user
  
  # create (post) action for when sign up form is submitted:
  post 'users' => 'users#create'

  resources :decks do
    resources :cards
  end

  # log in page with form:
  get '/login'     => 'sessions#new'
  
  # create (post) action for when log in form is submitted:
  post '/login'    => 'sessions#create'
  
  # delete action to log out:
  delete '/logout' => 'sessions#destroy'
end
