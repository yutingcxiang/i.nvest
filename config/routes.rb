Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show]

  resources :portfolios do
    resources :funds, only: [:index, :new, :create, :show]
  end
    
end
