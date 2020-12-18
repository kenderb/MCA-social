Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: %i[new create edit update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  post 'follow', to: 'followings#create'
  
  get 'users/:username', to: 'users#show', as: 'profile'


  post 'likes/:opinion_id', to: 'likes#create', as: 'likes'
  delete 'like', to: 'likes#destroy'
end
