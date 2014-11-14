Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: :create
  resources :notes, except: :edit
  get 'sign_up' => 'users#new', as: :sign_up
  resources :sessions, only: :create
  delete 'logout' => 'sessions#destroy', as: :logout
  get    'login'  => 'sessions#new',     as: :login
end
