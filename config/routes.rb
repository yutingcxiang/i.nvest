Rails.application.routes.draw do
  resources :assets
  resources :funds
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show] do
    resources :funds, only: [:index, :new, :create, :show]
  end

  resources :funds, only: [:index]
end
