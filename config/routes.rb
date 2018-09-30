Rails.application.routes.draw do
  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  resources :users, only: [:index, :new, :create, :show] do
    resources :funds
    resources :investments
  end

  get '/funds/top_funds' => 'funds#top_funds', as: 'top_funds'
end
