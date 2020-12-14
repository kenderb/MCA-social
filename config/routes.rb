Rails.application.routes.draw do
  root 'home#index'
  resource :users, only: [:new, :create, :edit,:show, :update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout',  to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  get 'users/:username', to: 'users#show', as: 'profile'
end
