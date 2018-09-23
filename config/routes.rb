Rails.application.routes.draw do
  resources :funds, only: [:index, :new, :create, :show]
  resources :portfolios
  resources :users, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
