Rails.application.routes.draw do
  root 'home#index'
  resource :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  post 'follow', to: 'followings#create'

  get 'users/:username', to: 'users#show', as: 'profile'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_profile'
  put 'users/:id', to: 'users#update', as: 'update_profile'

  post 'likes/:opinion_id', to: 'likes#create', as: 'likes'
  delete 'like', to: 'likes#destroy'
end
