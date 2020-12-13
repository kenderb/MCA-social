Rails.application.routes.draw do
  resource :users, only: ['new', 'create', 'edit', 'update']
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
