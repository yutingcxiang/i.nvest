Rails.application.routes.draw do
  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  resources :users, only: [:index, :new, :create, :show] do
    resources :funds, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :funds, only: [:index]
  resources :investments, only: [:index, :new, :create, :show]

  get '/investments/top_investments' => 'investments#top_investments', as: 'top_investments'
end
