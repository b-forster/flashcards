Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  root to: 'decks#index' 
    
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

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
